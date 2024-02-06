module BranchPredictor #(
    parameter INDEX_SIZE = 8
)(
    input clk,
    input reset,
    input [31:0] PC,
    input BranchResolved, BranchTaken,
    input [31:0] ResolvedBranchPC,
    input [31:0] ActualBranchTarget,
    output [31:0] Prediction
);

    parameter BTB_SIZE = 2 ** INDEX_SIZE;
    
    integer i;
    reg [31:0] BTB [BTB_SIZE-1:0];
    reg [23:0] TagTable [BTB_SIZE-1:0];
    reg [1:0] Counter [BTB_SIZE-1:0];
    wire PredictTaken;
    
    // Store the last two prediction history
    reg [1:0] PredictionHistory;
    
    always @(posedge clk) begin
        if (reset) begin
            for (i=0; i<BTB_SIZE; i=i+1) begin
                BTB[i] <= 0;
                TagTable[i] <= 8'hff;
                Counter[i] <= 1;
            end
            PredictionHistory <= 2'b00;
        end else begin  // Prediction history shift register
            PredictionHistory <= { PredictionHistory[1], PredictTaken };
        end
    end
    
    // Branch prediction logic
    assign PredictTaken = (TagTable[PC[INDEX_SIZE-1:0]] == PC[31:INDEX_SIZE]) && (Counter[PC[INDEX_SIZE-1:0]] >= 2);
    assign Prediction = PredictTaken ? BTB[PC[INDEX_SIZE-1:0]] : PC + 4;
    
    // Updating predictor based on the actual outcome of control instructions
    always @(negedge clk) begin
        if (BranchResolved) begin   // In EX stage
            if (BranchTaken) begin  // Branch taken
                if (Counter[ResolvedBranchPC[INDEX_SIZE-1:0]] != 3) begin
                    Counter[ResolvedBranchPC[INDEX_SIZE-1:0]] <= Counter[ResolvedBranchPC[INDEX_SIZE-1:0]] + 1;
                end
            end else begin          // Branch not taken
                if (Counter[ResolvedBranchPC[INDEX_SIZE-1:0]] != 0) begin
                    Counter[ResolvedBranchPC[INDEX_SIZE-1:0]] <= Counter[ResolvedBranchPC[INDEX_SIZE-1:0]] - 1;
                end
            end
            
            TagTable[ResolvedBranchPC[INDEX_SIZE-1:0]] <= ResolvedBranchPC[31:INDEX_SIZE];
            BTB[ResolvedBranchPC[INDEX_SIZE-1:0]] <= ActualBranchTarget;
        end
    end
    
endmodule
