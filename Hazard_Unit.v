module hazard_unit (
    output StallF,
    output StallD,
    output FlushD,
    output FlushE,
    output reg [1:0] ForwardAE,
    output reg [1:0] ForwardBE,

    input Match,
    input RegWriteM,
    input RegWriteW,
    input MemtoRegE,
    input PCSrcD,
    input PCSrcE,
    input PCSrcM,
    input PCSrcW,
    input BranchTakenE,
    input PCWrPendingF,

    input Match_1E_M,
    input Match_1E_W,
    input Match_2E_M,
    input Match_2E_W,
    input Match_12D_E

);

    wire LDRStallD;

    /* Forwarding */
    always @* begin
        if (Match_1E_M & RegWriteM) ForwardAE = 2'b10;

        else if (Match_1E_W & RegWriteW) ForwardAE = 2'b01;

        else ForwardAE = 2'b00;

        if (Match_2E_M & RegWriteM) ForwardBE = 2'b10;

        else if (Match_2E_W & RegWriteW) ForwardBE = 2'b01;

        else ForwardBE = 2'b00;
    end

    assign LDRStallD = Match_12D_E & MemtoRegE;
    assign StallD = LDRStallD;
    assign StallF = LDRStallD | PCWrPendingF;
    assign FlushE = LDRStallD | BranchTakenE;
    assign FlushD = PCWrPendingF | PCSrcW | BranchTakenE;

endmodule
