//
// Generated by Bluespec Compiler, version 2014.07.A (build 34078, 2014-07-30)
//
// On Wed May 31 23:52:15 CST 2017
//
// BVI format method schedule info:
// schedule writeServer_enq  CF ( readServer_readData_get,
// 			       readServer_readLen_get,
// 			       readServer_readReq_put,
// 			       dbg,
// 			       set_verbosity );
// schedule writeServer_enq  C ( writeServer_enq );
//
// schedule writeServer_notFull  CF ( writeServer_notFull,
// 				   readServer_readData_get,
// 				   readServer_readLen_get,
// 				   readServer_readReq_put,
// 				   dbg,
// 				   set_verbosity );
// schedule writeServer_notFull  SB ( writeServer_enq );
//
// schedule readServer_readData_get  CF ( writeServer_enq,
// 				       writeServer_notFull,
// 				       readServer_readLen_get,
// 				       readServer_readReq_put,
// 				       dbg,
// 				       set_verbosity );
// schedule readServer_readData_get  C ( readServer_readData_get );
//
// schedule readServer_readLen_get  CF ( writeServer_enq,
// 				      writeServer_notFull,
// 				      readServer_readData_get,
// 				      readServer_readReq_put,
// 				      dbg,
// 				      set_verbosity );
// schedule readServer_readLen_get  C ( readServer_readLen_get );
//
// schedule readServer_readReq_put  CF ( writeServer_enq,
// 				      writeServer_notFull,
// 				      readServer_readData_get,
// 				      readServer_readLen_get,
// 				      dbg,
// 				      set_verbosity );
// schedule readServer_readReq_put  C ( readServer_readReq_put );
//
// schedule dbg  CF ( writeServer_enq,
// 		   writeServer_notFull,
// 		   readServer_readData_get,
// 		   readServer_readLen_get,
// 		   readServer_readReq_put,
// 		   dbg,
// 		   set_verbosity );
//
// schedule set_verbosity  CF ( writeServer_enq,
// 			     writeServer_notFull,
// 			     readServer_readData_get,
// 			     readServer_readLen_get,
// 			     readServer_readReq_put,
// 			     dbg );
// schedule set_verbosity  SBR ( set_verbosity );
//
//
// Ports:
// Name                         I/O  size props
// RDY_writeServer_enq            O     1 reg
// writeServer_notFull            O     1 reg
// RDY_writeServer_notFull        O     1 const
// readServer_readData_get        O   610 reg
// RDY_readServer_readData_get    O     1 reg
// readServer_readLen_get         O    16 reg
// RDY_readServer_readLen_get     O     1 reg
// RDY_readServer_readReq_put     O     1 reg
// dbg                            O   256 reg
// RDY_dbg                        O     1 const
// RDY_set_verbosity              O     1 const
// CLK                            I     1 clock
// RST_N                          I     1 reset
// writeServer_enq_v              I   610 reg
// readServer_readReq_put         I    16 reg
// set_verbosity_verbosity        I    32 reg
// EN_writeServer_enq             I     1
// EN_readServer_readReq_put      I     1
// EN_set_verbosity               I     1
// EN_readServer_readData_get     I     1
// EN_readServer_readLen_get      I     1
//
// No combinational paths from inputs to outputs
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
  `define BSV_ASSIGNMENT_DELAY
`endif

`ifdef BSV_POSITIVE_RESET
  `define BSV_RESET_VALUE 1'b1
  `define BSV_RESET_EDGE posedge
`else
  `define BSV_RESET_VALUE 1'b0
  `define BSV_RESET_EDGE negedge
`endif

module mkPacketBuffer_64(CLK,
			 RST_N,

			 writeServer_enq_v,
			 EN_writeServer_enq,
			 RDY_writeServer_enq,

			 writeServer_notFull,
			 RDY_writeServer_notFull,

			 EN_readServer_readData_get,
			 readServer_readData_get,
			 RDY_readServer_readData_get,

			 EN_readServer_readLen_get,
			 readServer_readLen_get,
			 RDY_readServer_readLen_get,

			 readServer_readReq_put,
			 EN_readServer_readReq_put,
			 RDY_readServer_readReq_put,

			 dbg,
			 RDY_dbg,

			 set_verbosity_verbosity,
			 EN_set_verbosity,
			 RDY_set_verbosity);
  parameter param1 = "";
  input  CLK;
  input  RST_N;

  // action method writeServer_enq
  input  [609 : 0] writeServer_enq_v;
  input  EN_writeServer_enq;
  output RDY_writeServer_enq;

  // value method writeServer_notFull
  output writeServer_notFull;
  output RDY_writeServer_notFull;

  // actionvalue method readServer_readData_get
  input  EN_readServer_readData_get;
  output [609 : 0] readServer_readData_get;
  output RDY_readServer_readData_get;

  // actionvalue method readServer_readLen_get
  input  EN_readServer_readLen_get;
  output [15 : 0] readServer_readLen_get;
  output RDY_readServer_readLen_get;

  // action method readServer_readReq_put
  input  [15 : 0] readServer_readReq_put;
  input  EN_readServer_readReq_put;
  output RDY_readServer_readReq_put;

  // value method dbg
  output [255 : 0] dbg;
  output RDY_dbg;

  // action method set_verbosity
  input  [31 : 0] set_verbosity_verbosity;
  input  EN_set_verbosity;
  output RDY_set_verbosity;

  // signals for module outputs
  wire [609 : 0] readServer_readData_get;
  wire [255 : 0] dbg;
  wire [15 : 0] readServer_readLen_get;
  wire RDY_dbg,
       RDY_readServer_readData_get,
       RDY_readServer_readLen_get,
       RDY_readServer_readReq_put,
       RDY_set_verbosity,
       RDY_writeServer_enq,
       RDY_writeServer_notFull,
       writeServer_notFull;

  // inlined wires
  wire [609 : 0] memBuffer_serverAdapterB_outData_outData_wget;
  wire [1 : 0] memBuffer_serverAdapterB_s1_1_wget;
  wire memBuffer_serverAdapterA_outData_enqData_whas,
       memBuffer_serverAdapterA_writeWithResp_whas,
       memBuffer_serverAdapterB_cnt_1_whas,
       memBuffer_serverAdapterB_outData_enqData_whas,
       memBuffer_serverAdapterB_outData_outData_whas,
       memBuffer_serverAdapterB_writeWithResp_whas;

  // register cf_verbosity
  reg [31 : 0] cf_verbosity;
  wire [31 : 0] cf_verbosity_D_IN;
  wire cf_verbosity_EN;

  // register eopDeq
  reg [63 : 0] eopDeq;
  wire [63 : 0] eopDeq_D_IN;
  wire eopDeq_EN;

  // register eopEnq
  reg [63 : 0] eopEnq;
  wire [63 : 0] eopEnq_D_IN;
  wire eopEnq_EN;

  // register inPacket
  reg inPacket;
  wire inPacket_D_IN, inPacket_EN;

  // register memBuffer_serverAdapterA_cnt
  reg [2 : 0] memBuffer_serverAdapterA_cnt;
  wire [2 : 0] memBuffer_serverAdapterA_cnt_D_IN;
  wire memBuffer_serverAdapterA_cnt_EN;

  // register memBuffer_serverAdapterA_s1
  reg [1 : 0] memBuffer_serverAdapterA_s1;
  wire [1 : 0] memBuffer_serverAdapterA_s1_D_IN;
  wire memBuffer_serverAdapterA_s1_EN;

  // register memBuffer_serverAdapterA_s2
  reg [1 : 0] memBuffer_serverAdapterA_s2;
  wire [1 : 0] memBuffer_serverAdapterA_s2_D_IN;
  wire memBuffer_serverAdapterA_s2_EN;

  // register memBuffer_serverAdapterB_cnt
  reg [2 : 0] memBuffer_serverAdapterB_cnt;
  wire [2 : 0] memBuffer_serverAdapterB_cnt_D_IN;
  wire memBuffer_serverAdapterB_cnt_EN;

  // register memBuffer_serverAdapterB_s1
  reg [1 : 0] memBuffer_serverAdapterB_s1;
  wire [1 : 0] memBuffer_serverAdapterB_s1_D_IN;
  wire memBuffer_serverAdapterB_s1_EN;

  // register memBuffer_serverAdapterB_s2
  reg [1 : 0] memBuffer_serverAdapterB_s2;
  wire [1 : 0] memBuffer_serverAdapterB_s2_D_IN;
  wire memBuffer_serverAdapterB_s2_EN;

  // register outPacket
  reg outPacket;
  wire outPacket_D_IN, outPacket_EN;

  // register packetLen
  reg [15 : 0] packetLen;
  wire [15 : 0] packetLen_D_IN;
  wire packetLen_EN;

  // register rdCurrPtr
  reg [3 : 0] rdCurrPtr;
  wire [3 : 0] rdCurrPtr_D_IN;
  wire rdCurrPtr_EN;

  // register sopDeq
  reg [63 : 0] sopDeq;
  wire [63 : 0] sopDeq_D_IN;
  wire sopDeq_EN;

  // register sopEnq
  reg [63 : 0] sopEnq;
  wire [63 : 0] sopEnq_D_IN;
  wire sopEnq_EN;

  // register wrCurrPtr
  reg [3 : 0] wrCurrPtr;
  wire [3 : 0] wrCurrPtr_D_IN;
  wire wrCurrPtr_EN;

  // ports of submodule fifoEop
  wire [15 : 0] fifoEop_D_IN, fifoEop_D_OUT;
  wire fifoEop_CLR, fifoEop_DEQ, fifoEop_EMPTY_N, fifoEop_ENQ, fifoEop_FULL_N;

  // ports of submodule fifoLen
  wire [15 : 0] fifoLen_D_IN, fifoLen_D_OUT;
  wire fifoLen_CLR, fifoLen_DEQ, fifoLen_EMPTY_N, fifoLen_ENQ, fifoLen_FULL_N;

  // ports of submodule fifoReadData
  wire [609 : 0] fifoReadData_D_IN, fifoReadData_D_OUT;
  wire fifoReadData_CLR,
       fifoReadData_DEQ,
       fifoReadData_EMPTY_N,
       fifoReadData_ENQ,
       fifoReadData_FULL_N;

  // ports of submodule fifoReadReq
  wire [15 : 0] fifoReadReq_D_IN;
  wire fifoReadReq_CLR,
       fifoReadReq_DEQ,
       fifoReadReq_EMPTY_N,
       fifoReadReq_ENQ,
       fifoReadReq_FULL_N;

  // ports of submodule fifoWriteData
  wire [609 : 0] fifoWriteData_D_IN, fifoWriteData_D_OUT;
  wire fifoWriteData_CLR,
       fifoWriteData_DEQ,
       fifoWriteData_EMPTY_N,
       fifoWriteData_ENQ,
       fifoWriteData_FULL_N;

  // ports of submodule incomingReqs
  wire [613 : 0] incomingReqs_D_IN, incomingReqs_D_OUT;
  wire incomingReqs_CLR,
       incomingReqs_DEQ,
       incomingReqs_EMPTY_N,
       incomingReqs_ENQ,
       incomingReqs_FULL_N;

  // ports of submodule memBuffer_memory
  wire [609 : 0] memBuffer_memory_DIA,
		 memBuffer_memory_DIB,
		 memBuffer_memory_DOA,
		 memBuffer_memory_DOB;
  wire [3 : 0] memBuffer_memory_ADDRA, memBuffer_memory_ADDRB;
  wire memBuffer_memory_ENA,
       memBuffer_memory_ENB,
       memBuffer_memory_WEA,
       memBuffer_memory_WEB;

  // ports of submodule memBuffer_serverAdapterA_outDataCore
  wire [609 : 0] memBuffer_serverAdapterA_outDataCore_D_IN;
  wire memBuffer_serverAdapterA_outDataCore_CLR,
       memBuffer_serverAdapterA_outDataCore_DEQ,
       memBuffer_serverAdapterA_outDataCore_ENQ,
       memBuffer_serverAdapterA_outDataCore_FULL_N;

  // ports of submodule memBuffer_serverAdapterB_outDataCore
  wire [609 : 0] memBuffer_serverAdapterB_outDataCore_D_IN,
		 memBuffer_serverAdapterB_outDataCore_D_OUT;
  wire memBuffer_serverAdapterB_outDataCore_CLR,
       memBuffer_serverAdapterB_outDataCore_DEQ,
       memBuffer_serverAdapterB_outDataCore_EMPTY_N,
       memBuffer_serverAdapterB_outDataCore_ENQ,
       memBuffer_serverAdapterB_outDataCore_FULL_N;

  // rule scheduling signals
  wire WILL_FIRE_RL_commit_packet,
       WILL_FIRE_RL_dequeue_first_beat,
       WILL_FIRE_RL_dequeue_next_beat,
       WILL_FIRE_RL_enqueue_first_beat,
       WILL_FIRE_RL_memBuffer_serverAdapterB_outData_enqAndDeq,
       WILL_FIRE_RL_memBuffer_serverAdapterB_outData_setFirstEnq;

  // inputs to muxes for submodule ports
  wire [3 : 0] MUX_rdCurrPtr_write_1__VAL_1;
  wire MUX_inPacket_write_1__SEL_1,
       MUX_memBuffer_memory_b_put_1__SEL_1,
       MUX_outPacket_write_1__SEL_1;

  // remaining internal signals
  wire [15 : 0] newPacketLen__h5197;
  wire [6 : 0] x__h5286,
	       x__h5301,
	       x__h5313,
	       x__h5325,
	       x__h5337,
	       x__h5349,
	       x__h5361,
	       x__h5373,
	       x__h5385,
	       x__h5397,
	       x__h5409,
	       x__h5421,
	       x__h5433,
	       x__h5445,
	       x__h5457,
	       x__h5469,
	       x__h5481,
	       x__h5493,
	       x__h5505,
	       x__h5517,
	       x__h5529,
	       x__h5541,
	       x__h5553,
	       x__h5565,
	       x__h5577,
	       x__h5589,
	       x__h5601,
	       x__h5613,
	       x__h5625,
	       x__h5637,
	       x__h5649,
	       x__h5661,
	       x__h5673,
	       x__h5685,
	       x__h5697,
	       x__h5709,
	       x__h5721,
	       x__h5733,
	       x__h5745,
	       x__h5757,
	       x__h5769,
	       x__h5781,
	       x__h5793,
	       x__h5805,
	       x__h5817,
	       x__h5829,
	       x__h5841,
	       x__h5853,
	       x__h5865,
	       x__h5877,
	       x__h5889,
	       x__h5901,
	       x__h5913,
	       x__h5925,
	       x__h5937,
	       x__h5949,
	       x__h5961,
	       x__h5973,
	       x__h5985,
	       x__h5997,
	       x__h6009,
	       x__h6021,
	       x__h6033,
	       x__h6045,
	       y__h5302,
	       y__h5314,
	       y__h5326,
	       y__h5338,
	       y__h5350,
	       y__h5362,
	       y__h5374,
	       y__h5386,
	       y__h5398,
	       y__h5410,
	       y__h5422,
	       y__h5434,
	       y__h5446,
	       y__h5458,
	       y__h5470,
	       y__h5482,
	       y__h5494,
	       y__h5506,
	       y__h5518,
	       y__h5530,
	       y__h5542,
	       y__h5554,
	       y__h5566,
	       y__h5578,
	       y__h5590,
	       y__h5602,
	       y__h5614,
	       y__h5626,
	       y__h5638,
	       y__h5650,
	       y__h5662,
	       y__h5674,
	       y__h5686,
	       y__h5698,
	       y__h5710,
	       y__h5722,
	       y__h5734,
	       y__h5746,
	       y__h5758,
	       y__h5770,
	       y__h5782,
	       y__h5794,
	       y__h5806,
	       y__h5818,
	       y__h5830,
	       y__h5842,
	       y__h5854,
	       y__h5866,
	       y__h5878,
	       y__h5890,
	       y__h5902,
	       y__h5914,
	       y__h5926,
	       y__h5938,
	       y__h5950,
	       y__h5962,
	       y__h5974,
	       y__h5986,
	       y__h5998,
	       y__h6010,
	       y__h6022,
	       y__h6034,
	       y__h6046;
  wire [2 : 0] memBuffer_serverAdapterB_cnt_1_PLUS_IF_memBuff_ETC___d97;
  wire [1 : 0] ab__h4227;
  wire memBuffer_serverAdapterA_cnt_6_SLT_3___d339,
       memBuffer_serverAdapterB_cnt_1_SLT_3___d365;

  // action method writeServer_enq
  assign RDY_writeServer_enq = fifoWriteData_FULL_N ;

  // value method writeServer_notFull
  assign writeServer_notFull = fifoWriteData_FULL_N ;
  assign RDY_writeServer_notFull = 1'd1 ;

  // actionvalue method readServer_readData_get
  assign readServer_readData_get = fifoReadData_D_OUT ;
  assign RDY_readServer_readData_get = fifoReadData_EMPTY_N ;

  // actionvalue method readServer_readLen_get
  assign readServer_readLen_get = fifoLen_D_OUT ;
  assign RDY_readServer_readLen_get = fifoLen_EMPTY_N ;

  // action method readServer_readReq_put
  assign RDY_readServer_readReq_put = fifoReadReq_FULL_N ;

  // value method dbg
  assign dbg = { sopEnq, eopEnq, sopDeq, eopDeq } ;
  assign RDY_dbg = 1'd1 ;

  // action method set_verbosity
  assign RDY_set_verbosity = 1'd1 ;

  // submodule fifoEop
  FIFO2 #(.width(32'd16), .guarded(32'd1)) fifoEop(.RST(RST_N),
						   .CLK(CLK),
						   .D_IN(fifoEop_D_IN),
						   .ENQ(fifoEop_ENQ),
						   .DEQ(fifoEop_DEQ),
						   .CLR(fifoEop_CLR),
						   .D_OUT(fifoEop_D_OUT),
						   .FULL_N(fifoEop_FULL_N),
						   .EMPTY_N(fifoEop_EMPTY_N));

  // submodule fifoLen
  SizedFIFO #(.p1width(32'd16),
	      .p2depth(32'd16),
	      .p3cntr_width(32'd4),
	      .guarded(32'd1)) fifoLen(.RST(RST_N),
				       .CLK(CLK),
				       .D_IN(fifoLen_D_IN),
				       .ENQ(fifoLen_ENQ),
				       .DEQ(fifoLen_DEQ),
				       .CLR(fifoLen_CLR),
				       .D_OUT(fifoLen_D_OUT),
				       .FULL_N(fifoLen_FULL_N),
				       .EMPTY_N(fifoLen_EMPTY_N));

  // submodule fifoReadData
  FIFO2 #(.width(32'd610), .guarded(32'd1)) fifoReadData(.RST(RST_N),
							 .CLK(CLK),
							 .D_IN(fifoReadData_D_IN),
							 .ENQ(fifoReadData_ENQ),
							 .DEQ(fifoReadData_DEQ),
							 .CLR(fifoReadData_CLR),
							 .D_OUT(fifoReadData_D_OUT),
							 .FULL_N(fifoReadData_FULL_N),
							 .EMPTY_N(fifoReadData_EMPTY_N));

  // submodule fifoReadReq
  FIFO2 #(.width(32'd16), .guarded(32'd1)) fifoReadReq(.RST(RST_N),
						       .CLK(CLK),
						       .D_IN(fifoReadReq_D_IN),
						       .ENQ(fifoReadReq_ENQ),
						       .DEQ(fifoReadReq_DEQ),
						       .CLR(fifoReadReq_CLR),
						       .D_OUT(),
						       .FULL_N(fifoReadReq_FULL_N),
						       .EMPTY_N(fifoReadReq_EMPTY_N));

  // submodule fifoWriteData
  FIFO2 #(.width(32'd610), .guarded(32'd1)) fifoWriteData(.RST(RST_N),
							  .CLK(CLK),
							  .D_IN(fifoWriteData_D_IN),
							  .ENQ(fifoWriteData_ENQ),
							  .DEQ(fifoWriteData_DEQ),
							  .CLR(fifoWriteData_CLR),
							  .D_OUT(fifoWriteData_D_OUT),
							  .FULL_N(fifoWriteData_FULL_N),
							  .EMPTY_N(fifoWriteData_EMPTY_N));

  // submodule incomingReqs
  FIFO2 #(.width(32'd614), .guarded(32'd1)) incomingReqs(.RST(RST_N),
							 .CLK(CLK),
							 .D_IN(incomingReqs_D_IN),
							 .ENQ(incomingReqs_ENQ),
							 .DEQ(incomingReqs_DEQ),
							 .CLR(incomingReqs_CLR),
							 .D_OUT(incomingReqs_D_OUT),
							 .FULL_N(incomingReqs_FULL_N),
							 .EMPTY_N(incomingReqs_EMPTY_N));

  // submodule localReset
  SyncReset #(.RSTDELAY(32'd1)) localReset(.CLK(CLK),
					   .IN_RST(RST_N),
					   .OUT_RST());

  // submodule memBuffer_memory
  BRAM2 #(.PIPELINED(1'd1),
	  .ADDR_WIDTH(32'd4),
	  .DATA_WIDTH(32'd610),
	  .MEMSIZE(5'd16)) memBuffer_memory(.CLKA(CLK),
					    .CLKB(CLK),
					    .ADDRA(memBuffer_memory_ADDRA),
					    .ADDRB(memBuffer_memory_ADDRB),
					    .DIA(memBuffer_memory_DIA),
					    .DIB(memBuffer_memory_DIB),
					    .WEA(memBuffer_memory_WEA),
					    .WEB(memBuffer_memory_WEB),
					    .ENA(memBuffer_memory_ENA),
					    .ENB(memBuffer_memory_ENB),
					    .DOA(memBuffer_memory_DOA),
					    .DOB(memBuffer_memory_DOB));

  // submodule memBuffer_serverAdapterA_outDataCore
  SizedFIFO #(.p1width(32'd610),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) memBuffer_serverAdapterA_outDataCore(.RST(RST_N),
								    .CLK(CLK),
								    .D_IN(memBuffer_serverAdapterA_outDataCore_D_IN),
								    .ENQ(memBuffer_serverAdapterA_outDataCore_ENQ),
								    .DEQ(memBuffer_serverAdapterA_outDataCore_DEQ),
								    .CLR(memBuffer_serverAdapterA_outDataCore_CLR),
								    .D_OUT(),
								    .FULL_N(memBuffer_serverAdapterA_outDataCore_FULL_N),
								    .EMPTY_N());

  // submodule memBuffer_serverAdapterB_outDataCore
  SizedFIFO #(.p1width(32'd610),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) memBuffer_serverAdapterB_outDataCore(.RST(RST_N),
								    .CLK(CLK),
								    .D_IN(memBuffer_serverAdapterB_outDataCore_D_IN),
								    .ENQ(memBuffer_serverAdapterB_outDataCore_ENQ),
								    .DEQ(memBuffer_serverAdapterB_outDataCore_DEQ),
								    .CLR(memBuffer_serverAdapterB_outDataCore_CLR),
								    .D_OUT(memBuffer_serverAdapterB_outDataCore_D_OUT),
								    .FULL_N(memBuffer_serverAdapterB_outDataCore_FULL_N),
								    .EMPTY_N(memBuffer_serverAdapterB_outDataCore_EMPTY_N));

  // rule RL_enqueue_first_beat
  assign WILL_FIRE_RL_enqueue_first_beat =
	     incomingReqs_EMPTY_N &&
	     memBuffer_serverAdapterA_cnt_6_SLT_3___d339 &&
	     !fifoEop_EMPTY_N &&
	     !inPacket ;

  // rule RL_commit_packet
  assign WILL_FIRE_RL_commit_packet =
	     incomingReqs_EMPTY_N &&
	     memBuffer_serverAdapterA_cnt_6_SLT_3___d339 &&
	     fifoEop_EMPTY_N &&
	     fifoLen_FULL_N &&
	     fifoEop_EMPTY_N &&
	     inPacket ;

  // rule RL_dequeue_first_beat
  assign WILL_FIRE_RL_dequeue_first_beat =
	     fifoReadReq_EMPTY_N &&
	     memBuffer_serverAdapterB_cnt_1_SLT_3___d365 &&
	     !outPacket ;

  // rule RL_memBuffer_serverAdapterB_outData_setFirstEnq
  assign WILL_FIRE_RL_memBuffer_serverAdapterB_outData_setFirstEnq =
	     !memBuffer_serverAdapterB_outDataCore_EMPTY_N &&
	     memBuffer_serverAdapterB_outData_enqData_whas ;

  // rule RL_dequeue_next_beat
  assign WILL_FIRE_RL_dequeue_next_beat =
	     (memBuffer_serverAdapterB_outDataCore_EMPTY_N ||
	      memBuffer_serverAdapterB_outData_enqData_whas) &&
	     memBuffer_serverAdapterB_outData_outData_whas &&
	     fifoReadData_FULL_N &&
	     (memBuffer_serverAdapterB_outData_outData_wget[0] ||
	      memBuffer_serverAdapterB_cnt_1_SLT_3___d365) &&
	     outPacket ;

  // rule RL_memBuffer_serverAdapterB_outData_enqAndDeq
  assign WILL_FIRE_RL_memBuffer_serverAdapterB_outData_enqAndDeq =
	     memBuffer_serverAdapterB_outDataCore_EMPTY_N &&
	     memBuffer_serverAdapterB_outDataCore_FULL_N &&
	     WILL_FIRE_RL_dequeue_next_beat &&
	     memBuffer_serverAdapterB_outData_enqData_whas ;

  // inputs to muxes for submodule ports
  assign MUX_inPacket_write_1__SEL_1 =
	     fifoWriteData_EMPTY_N && incomingReqs_FULL_N &&
	     (!fifoWriteData_D_OUT[0] || fifoEop_FULL_N) ;
  assign MUX_memBuffer_memory_b_put_1__SEL_1 =
	     WILL_FIRE_RL_dequeue_next_beat &&
	     !memBuffer_serverAdapterB_outData_outData_wget[0] ;
  assign MUX_outPacket_write_1__SEL_1 =
	     WILL_FIRE_RL_dequeue_next_beat &&
	     memBuffer_serverAdapterB_outData_outData_wget[0] ;
  assign MUX_rdCurrPtr_write_1__VAL_1 = rdCurrPtr + 4'd1 ;

  // inlined wires
  assign memBuffer_serverAdapterA_outData_enqData_whas =
	     (!memBuffer_serverAdapterA_s2[0] ||
	      memBuffer_serverAdapterA_outDataCore_FULL_N) &&
	     memBuffer_serverAdapterA_s2[1] &&
	     memBuffer_serverAdapterA_s2[0] ;
  assign memBuffer_serverAdapterA_writeWithResp_whas =
	     WILL_FIRE_RL_commit_packet ||
	     incomingReqs_EMPTY_N &&
	     memBuffer_serverAdapterA_cnt_6_SLT_3___d339 &&
	     !fifoEop_EMPTY_N &&
	     inPacket ||
	     WILL_FIRE_RL_enqueue_first_beat ;
  assign memBuffer_serverAdapterB_outData_enqData_whas =
	     (!memBuffer_serverAdapterB_s2[0] ||
	      memBuffer_serverAdapterB_outDataCore_FULL_N) &&
	     memBuffer_serverAdapterB_s2[1] &&
	     memBuffer_serverAdapterB_s2[0] ;
  assign memBuffer_serverAdapterB_outData_outData_wget =
	     WILL_FIRE_RL_memBuffer_serverAdapterB_outData_setFirstEnq ?
	       memBuffer_memory_DOB :
	       memBuffer_serverAdapterB_outDataCore_D_OUT ;
  assign memBuffer_serverAdapterB_outData_outData_whas =
	     WILL_FIRE_RL_memBuffer_serverAdapterB_outData_setFirstEnq ||
	     memBuffer_serverAdapterB_outDataCore_EMPTY_N ;
  assign memBuffer_serverAdapterB_cnt_1_whas =
	     (MUX_memBuffer_memory_b_put_1__SEL_1 ||
	      WILL_FIRE_RL_dequeue_first_beat) &&
	     (!ab__h4227[1] || ab__h4227[0]) ;
  assign memBuffer_serverAdapterB_writeWithResp_whas =
	     MUX_memBuffer_memory_b_put_1__SEL_1 ||
	     WILL_FIRE_RL_dequeue_first_beat ;
  assign memBuffer_serverAdapterB_s1_1_wget =
	     { 1'd1, !ab__h4227[1] || ab__h4227[0] } ;

  // register cf_verbosity
  assign cf_verbosity_D_IN = set_verbosity_verbosity ;
  assign cf_verbosity_EN = EN_set_verbosity ;

  // register eopDeq
  assign eopDeq_D_IN = eopDeq + 64'd1 ;
  assign eopDeq_EN = MUX_outPacket_write_1__SEL_1 ;

  // register eopEnq
  assign eopEnq_D_IN = eopEnq + 64'd1 ;
  assign eopEnq_EN = WILL_FIRE_RL_commit_packet ;

  // register inPacket
  assign inPacket_D_IN = MUX_inPacket_write_1__SEL_1 ;
  assign inPacket_EN =
	     WILL_FIRE_RL_commit_packet || MUX_inPacket_write_1__SEL_1 ;

  // register memBuffer_serverAdapterA_cnt
  assign memBuffer_serverAdapterA_cnt_D_IN =
	     memBuffer_serverAdapterA_cnt + 3'd0 + 3'd0 ;
  assign memBuffer_serverAdapterA_cnt_EN = 1'b0 ;

  // register memBuffer_serverAdapterA_s1
  assign memBuffer_serverAdapterA_s1_D_IN =
	     { memBuffer_serverAdapterA_writeWithResp_whas, 1'b0 } ;
  assign memBuffer_serverAdapterA_s1_EN = 1'd1 ;

  // register memBuffer_serverAdapterA_s2
  assign memBuffer_serverAdapterA_s2_D_IN = memBuffer_serverAdapterA_s1 ;
  assign memBuffer_serverAdapterA_s2_EN =
	     memBuffer_serverAdapterA_s1[1] ||
	     memBuffer_serverAdapterA_s2[1] ;

  // register memBuffer_serverAdapterB_cnt
  assign memBuffer_serverAdapterB_cnt_D_IN =
	     memBuffer_serverAdapterB_cnt_1_PLUS_IF_memBuff_ETC___d97 ;
  assign memBuffer_serverAdapterB_cnt_EN =
	     memBuffer_serverAdapterB_cnt_1_whas ||
	     WILL_FIRE_RL_dequeue_next_beat ;

  // register memBuffer_serverAdapterB_s1
  assign memBuffer_serverAdapterB_s1_D_IN =
	     { memBuffer_serverAdapterB_writeWithResp_whas &&
	       memBuffer_serverAdapterB_s1_1_wget[1],
	       memBuffer_serverAdapterB_s1_1_wget[0] } ;
  assign memBuffer_serverAdapterB_s1_EN = 1'd1 ;

  // register memBuffer_serverAdapterB_s2
  assign memBuffer_serverAdapterB_s2_D_IN = memBuffer_serverAdapterB_s1 ;
  assign memBuffer_serverAdapterB_s2_EN =
	     memBuffer_serverAdapterB_s1[1] ||
	     memBuffer_serverAdapterB_s2[1] ;

  // register outPacket
  assign outPacket_D_IN = !MUX_outPacket_write_1__SEL_1 ;
  assign outPacket_EN =
	     WILL_FIRE_RL_dequeue_next_beat &&
	     memBuffer_serverAdapterB_outData_outData_wget[0] ||
	     WILL_FIRE_RL_dequeue_first_beat ;

  // register packetLen
  assign packetLen_D_IN =
	     fifoWriteData_D_OUT[0] ? 16'd0 : newPacketLen__h5197 ;
  assign packetLen_EN = MUX_inPacket_write_1__SEL_1 ;

  // register rdCurrPtr
  assign rdCurrPtr_D_IN =
	     MUX_memBuffer_memory_b_put_1__SEL_1 ?
	       MUX_rdCurrPtr_write_1__VAL_1 :
	       MUX_rdCurrPtr_write_1__VAL_1 ;
  assign rdCurrPtr_EN =
	     WILL_FIRE_RL_dequeue_next_beat &&
	     !memBuffer_serverAdapterB_outData_outData_wget[0] ||
	     WILL_FIRE_RL_dequeue_first_beat ;

  // register sopDeq
  assign sopDeq_D_IN = sopDeq + 64'd1 ;
  assign sopDeq_EN = WILL_FIRE_RL_dequeue_first_beat ;

  // register sopEnq
  assign sopEnq_D_IN = sopEnq + 64'd1 ;
  assign sopEnq_EN = WILL_FIRE_RL_enqueue_first_beat ;

  // register wrCurrPtr
  assign wrCurrPtr_D_IN = wrCurrPtr + 4'd1 ;
  assign wrCurrPtr_EN = MUX_inPacket_write_1__SEL_1 ;

  // submodule fifoEop
  assign fifoEop_D_IN = packetLen + { 9'd0, x__h5286 } ;
  assign fifoEop_ENQ = MUX_inPacket_write_1__SEL_1 && fifoWriteData_D_OUT[0] ;
  assign fifoEop_DEQ = WILL_FIRE_RL_commit_packet ;
  assign fifoEop_CLR = 1'b0 ;

  // submodule fifoLen
  assign fifoLen_D_IN = fifoEop_D_OUT ;
  assign fifoLen_ENQ = WILL_FIRE_RL_commit_packet ;
  assign fifoLen_DEQ = EN_readServer_readLen_get ;
  assign fifoLen_CLR = 1'b0 ;

  // submodule fifoReadData
  assign fifoReadData_D_IN = memBuffer_serverAdapterB_outData_outData_wget ;
  assign fifoReadData_ENQ = WILL_FIRE_RL_dequeue_next_beat ;
  assign fifoReadData_DEQ = EN_readServer_readData_get ;
  assign fifoReadData_CLR = 1'b0 ;

  // submodule fifoReadReq
  assign fifoReadReq_D_IN = readServer_readReq_put ;
  assign fifoReadReq_ENQ = EN_readServer_readReq_put ;
  assign fifoReadReq_DEQ = WILL_FIRE_RL_dequeue_first_beat ;
  assign fifoReadReq_CLR = 1'b0 ;

  // submodule fifoWriteData
  assign fifoWriteData_D_IN = writeServer_enq_v ;
  assign fifoWriteData_ENQ = EN_writeServer_enq ;
  assign fifoWriteData_DEQ = MUX_inPacket_write_1__SEL_1 ;
  assign fifoWriteData_CLR = 1'b0 ;

  // submodule incomingReqs
  assign incomingReqs_D_IN = { wrCurrPtr, fifoWriteData_D_OUT } ;
  assign incomingReqs_ENQ = MUX_inPacket_write_1__SEL_1 ;
  assign incomingReqs_DEQ = memBuffer_serverAdapterA_writeWithResp_whas ;
  assign incomingReqs_CLR = 1'b0 ;

  // submodule memBuffer_memory
  assign memBuffer_memory_ADDRA = incomingReqs_D_OUT[613:610] ;
  assign memBuffer_memory_ADDRB = rdCurrPtr ;
  assign memBuffer_memory_DIA = incomingReqs_D_OUT[609:0] ;
  assign memBuffer_memory_DIB =
	     MUX_memBuffer_memory_b_put_1__SEL_1 ?
	       610'h2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */  :
	       610'h2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */  ;
  assign memBuffer_memory_WEA = 1'd1 ;
  assign memBuffer_memory_WEB = 1'd0 ;
  assign memBuffer_memory_ENA = memBuffer_serverAdapterA_writeWithResp_whas ;
  assign memBuffer_memory_ENB =
	     WILL_FIRE_RL_dequeue_next_beat &&
	     !memBuffer_serverAdapterB_outData_outData_wget[0] ||
	     WILL_FIRE_RL_dequeue_first_beat ;

  // submodule memBuffer_serverAdapterA_outDataCore
  assign memBuffer_serverAdapterA_outDataCore_D_IN = memBuffer_memory_DOA ;
  assign memBuffer_serverAdapterA_outDataCore_ENQ =
	     memBuffer_serverAdapterA_outDataCore_FULL_N &&
	     memBuffer_serverAdapterA_outData_enqData_whas ;
  assign memBuffer_serverAdapterA_outDataCore_DEQ = 1'b0 ;
  assign memBuffer_serverAdapterA_outDataCore_CLR = 1'b0 ;

  // submodule memBuffer_serverAdapterB_outDataCore
  assign memBuffer_serverAdapterB_outDataCore_D_IN = memBuffer_memory_DOB ;
  assign memBuffer_serverAdapterB_outDataCore_ENQ =
	     WILL_FIRE_RL_memBuffer_serverAdapterB_outData_enqAndDeq ||
	     memBuffer_serverAdapterB_outDataCore_FULL_N &&
	     !WILL_FIRE_RL_dequeue_next_beat &&
	     memBuffer_serverAdapterB_outData_enqData_whas ;
  assign memBuffer_serverAdapterB_outDataCore_DEQ =
	     WILL_FIRE_RL_memBuffer_serverAdapterB_outData_enqAndDeq ||
	     memBuffer_serverAdapterB_outDataCore_EMPTY_N &&
	     WILL_FIRE_RL_dequeue_next_beat &&
	     !memBuffer_serverAdapterB_outData_enqData_whas ;
  assign memBuffer_serverAdapterB_outDataCore_CLR = 1'b0 ;

  // remaining internal signals
  assign ab__h4227 = 2'd0 ;
  assign memBuffer_serverAdapterA_cnt_6_SLT_3___d339 =
	     (memBuffer_serverAdapterA_cnt ^ 3'h4) < 3'd7 ;
  assign memBuffer_serverAdapterB_cnt_1_PLUS_IF_memBuff_ETC___d97 =
	     memBuffer_serverAdapterB_cnt +
	     (memBuffer_serverAdapterB_cnt_1_whas ? 3'd1 : 3'd0) +
	     (WILL_FIRE_RL_dequeue_next_beat ? 3'd7 : 3'd0) ;
  assign memBuffer_serverAdapterB_cnt_1_SLT_3___d365 =
	     (memBuffer_serverAdapterB_cnt ^ 3'h4) < 3'd7 ;
  assign newPacketLen__h5197 = packetLen + { 9'd0, x__h5286 } ;
  assign x__h5286 = x__h5301 + y__h5302 ;
  assign x__h5301 = x__h5313 + y__h5314 ;
  assign x__h5313 = x__h5325 + y__h5326 ;
  assign x__h5325 = x__h5337 + y__h5338 ;
  assign x__h5337 = x__h5349 + y__h5350 ;
  assign x__h5349 = x__h5361 + y__h5362 ;
  assign x__h5361 = x__h5373 + y__h5374 ;
  assign x__h5373 = x__h5385 + y__h5386 ;
  assign x__h5385 = x__h5397 + y__h5398 ;
  assign x__h5397 = x__h5409 + y__h5410 ;
  assign x__h5409 = x__h5421 + y__h5422 ;
  assign x__h5421 = x__h5433 + y__h5434 ;
  assign x__h5433 = x__h5445 + y__h5446 ;
  assign x__h5445 = x__h5457 + y__h5458 ;
  assign x__h5457 = x__h5469 + y__h5470 ;
  assign x__h5469 = x__h5481 + y__h5482 ;
  assign x__h5481 = x__h5493 + y__h5494 ;
  assign x__h5493 = x__h5505 + y__h5506 ;
  assign x__h5505 = x__h5517 + y__h5518 ;
  assign x__h5517 = x__h5529 + y__h5530 ;
  assign x__h5529 = x__h5541 + y__h5542 ;
  assign x__h5541 = x__h5553 + y__h5554 ;
  assign x__h5553 = x__h5565 + y__h5566 ;
  assign x__h5565 = x__h5577 + y__h5578 ;
  assign x__h5577 = x__h5589 + y__h5590 ;
  assign x__h5589 = x__h5601 + y__h5602 ;
  assign x__h5601 = x__h5613 + y__h5614 ;
  assign x__h5613 = x__h5625 + y__h5626 ;
  assign x__h5625 = x__h5637 + y__h5638 ;
  assign x__h5637 = x__h5649 + y__h5650 ;
  assign x__h5649 = x__h5661 + y__h5662 ;
  assign x__h5661 = x__h5673 + y__h5674 ;
  assign x__h5673 = x__h5685 + y__h5686 ;
  assign x__h5685 = x__h5697 + y__h5698 ;
  assign x__h5697 = x__h5709 + y__h5710 ;
  assign x__h5709 = x__h5721 + y__h5722 ;
  assign x__h5721 = x__h5733 + y__h5734 ;
  assign x__h5733 = x__h5745 + y__h5746 ;
  assign x__h5745 = x__h5757 + y__h5758 ;
  assign x__h5757 = x__h5769 + y__h5770 ;
  assign x__h5769 = x__h5781 + y__h5782 ;
  assign x__h5781 = x__h5793 + y__h5794 ;
  assign x__h5793 = x__h5805 + y__h5806 ;
  assign x__h5805 = x__h5817 + y__h5818 ;
  assign x__h5817 = x__h5829 + y__h5830 ;
  assign x__h5829 = x__h5841 + y__h5842 ;
  assign x__h5841 = x__h5853 + y__h5854 ;
  assign x__h5853 = x__h5865 + y__h5866 ;
  assign x__h5865 = x__h5877 + y__h5878 ;
  assign x__h5877 = x__h5889 + y__h5890 ;
  assign x__h5889 = x__h5901 + y__h5902 ;
  assign x__h5901 = x__h5913 + y__h5914 ;
  assign x__h5913 = x__h5925 + y__h5926 ;
  assign x__h5925 = x__h5937 + y__h5938 ;
  assign x__h5937 = x__h5949 + y__h5950 ;
  assign x__h5949 = x__h5961 + y__h5962 ;
  assign x__h5961 = x__h5973 + y__h5974 ;
  assign x__h5973 = x__h5985 + y__h5986 ;
  assign x__h5985 = x__h5997 + y__h5998 ;
  assign x__h5997 = x__h6009 + y__h6010 ;
  assign x__h6009 = x__h6021 + y__h6022 ;
  assign x__h6021 = x__h6033 + y__h6034 ;
  assign x__h6033 = x__h6045 + y__h6046 ;
  assign x__h6045 = { 6'd0, fifoWriteData_D_OUT[65] } ;
  assign y__h5302 = { 6'd0, fifoWriteData_D_OUT[2] } ;
  assign y__h5314 = { 6'd0, fifoWriteData_D_OUT[3] } ;
  assign y__h5326 = { 6'd0, fifoWriteData_D_OUT[4] } ;
  assign y__h5338 = { 6'd0, fifoWriteData_D_OUT[5] } ;
  assign y__h5350 = { 6'd0, fifoWriteData_D_OUT[6] } ;
  assign y__h5362 = { 6'd0, fifoWriteData_D_OUT[7] } ;
  assign y__h5374 = { 6'd0, fifoWriteData_D_OUT[8] } ;
  assign y__h5386 = { 6'd0, fifoWriteData_D_OUT[9] } ;
  assign y__h5398 = { 6'd0, fifoWriteData_D_OUT[10] } ;
  assign y__h5410 = { 6'd0, fifoWriteData_D_OUT[11] } ;
  assign y__h5422 = { 6'd0, fifoWriteData_D_OUT[12] } ;
  assign y__h5434 = { 6'd0, fifoWriteData_D_OUT[13] } ;
  assign y__h5446 = { 6'd0, fifoWriteData_D_OUT[14] } ;
  assign y__h5458 = { 6'd0, fifoWriteData_D_OUT[15] } ;
  assign y__h5470 = { 6'd0, fifoWriteData_D_OUT[16] } ;
  assign y__h5482 = { 6'd0, fifoWriteData_D_OUT[17] } ;
  assign y__h5494 = { 6'd0, fifoWriteData_D_OUT[18] } ;
  assign y__h5506 = { 6'd0, fifoWriteData_D_OUT[19] } ;
  assign y__h5518 = { 6'd0, fifoWriteData_D_OUT[20] } ;
  assign y__h5530 = { 6'd0, fifoWriteData_D_OUT[21] } ;
  assign y__h5542 = { 6'd0, fifoWriteData_D_OUT[22] } ;
  assign y__h5554 = { 6'd0, fifoWriteData_D_OUT[23] } ;
  assign y__h5566 = { 6'd0, fifoWriteData_D_OUT[24] } ;
  assign y__h5578 = { 6'd0, fifoWriteData_D_OUT[25] } ;
  assign y__h5590 = { 6'd0, fifoWriteData_D_OUT[26] } ;
  assign y__h5602 = { 6'd0, fifoWriteData_D_OUT[27] } ;
  assign y__h5614 = { 6'd0, fifoWriteData_D_OUT[28] } ;
  assign y__h5626 = { 6'd0, fifoWriteData_D_OUT[29] } ;
  assign y__h5638 = { 6'd0, fifoWriteData_D_OUT[30] } ;
  assign y__h5650 = { 6'd0, fifoWriteData_D_OUT[31] } ;
  assign y__h5662 = { 6'd0, fifoWriteData_D_OUT[32] } ;
  assign y__h5674 = { 6'd0, fifoWriteData_D_OUT[33] } ;
  assign y__h5686 = { 6'd0, fifoWriteData_D_OUT[34] } ;
  assign y__h5698 = { 6'd0, fifoWriteData_D_OUT[35] } ;
  assign y__h5710 = { 6'd0, fifoWriteData_D_OUT[36] } ;
  assign y__h5722 = { 6'd0, fifoWriteData_D_OUT[37] } ;
  assign y__h5734 = { 6'd0, fifoWriteData_D_OUT[38] } ;
  assign y__h5746 = { 6'd0, fifoWriteData_D_OUT[39] } ;
  assign y__h5758 = { 6'd0, fifoWriteData_D_OUT[40] } ;
  assign y__h5770 = { 6'd0, fifoWriteData_D_OUT[41] } ;
  assign y__h5782 = { 6'd0, fifoWriteData_D_OUT[42] } ;
  assign y__h5794 = { 6'd0, fifoWriteData_D_OUT[43] } ;
  assign y__h5806 = { 6'd0, fifoWriteData_D_OUT[44] } ;
  assign y__h5818 = { 6'd0, fifoWriteData_D_OUT[45] } ;
  assign y__h5830 = { 6'd0, fifoWriteData_D_OUT[46] } ;
  assign y__h5842 = { 6'd0, fifoWriteData_D_OUT[47] } ;
  assign y__h5854 = { 6'd0, fifoWriteData_D_OUT[48] } ;
  assign y__h5866 = { 6'd0, fifoWriteData_D_OUT[49] } ;
  assign y__h5878 = { 6'd0, fifoWriteData_D_OUT[50] } ;
  assign y__h5890 = { 6'd0, fifoWriteData_D_OUT[51] } ;
  assign y__h5902 = { 6'd0, fifoWriteData_D_OUT[52] } ;
  assign y__h5914 = { 6'd0, fifoWriteData_D_OUT[53] } ;
  assign y__h5926 = { 6'd0, fifoWriteData_D_OUT[54] } ;
  assign y__h5938 = { 6'd0, fifoWriteData_D_OUT[55] } ;
  assign y__h5950 = { 6'd0, fifoWriteData_D_OUT[56] } ;
  assign y__h5962 = { 6'd0, fifoWriteData_D_OUT[57] } ;
  assign y__h5974 = { 6'd0, fifoWriteData_D_OUT[58] } ;
  assign y__h5986 = { 6'd0, fifoWriteData_D_OUT[59] } ;
  assign y__h5998 = { 6'd0, fifoWriteData_D_OUT[60] } ;
  assign y__h6010 = { 6'd0, fifoWriteData_D_OUT[61] } ;
  assign y__h6022 = { 6'd0, fifoWriteData_D_OUT[62] } ;
  assign y__h6034 = { 6'd0, fifoWriteData_D_OUT[63] } ;
  assign y__h6046 = { 6'd0, fifoWriteData_D_OUT[64] } ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        eopDeq <= `BSV_ASSIGNMENT_DELAY 64'd0;
	eopEnq <= `BSV_ASSIGNMENT_DELAY 64'd0;
	inPacket <= `BSV_ASSIGNMENT_DELAY 1'd0;
	memBuffer_serverAdapterA_cnt <= `BSV_ASSIGNMENT_DELAY 3'd0;
	memBuffer_serverAdapterA_s1 <= `BSV_ASSIGNMENT_DELAY 2'd0;
	memBuffer_serverAdapterA_s2 <= `BSV_ASSIGNMENT_DELAY 2'd0;
	memBuffer_serverAdapterB_cnt <= `BSV_ASSIGNMENT_DELAY 3'd0;
	memBuffer_serverAdapterB_s1 <= `BSV_ASSIGNMENT_DELAY 2'd0;
	memBuffer_serverAdapterB_s2 <= `BSV_ASSIGNMENT_DELAY 2'd0;
	outPacket <= `BSV_ASSIGNMENT_DELAY 1'd0;
	packetLen <= `BSV_ASSIGNMENT_DELAY 16'd0;
	rdCurrPtr <= `BSV_ASSIGNMENT_DELAY 4'd0;
	sopDeq <= `BSV_ASSIGNMENT_DELAY 64'd0;
	sopEnq <= `BSV_ASSIGNMENT_DELAY 64'd0;
	wrCurrPtr <= `BSV_ASSIGNMENT_DELAY 4'd0;
      end
    else
      begin
        if (eopDeq_EN) eopDeq <= `BSV_ASSIGNMENT_DELAY eopDeq_D_IN;
	if (eopEnq_EN) eopEnq <= `BSV_ASSIGNMENT_DELAY eopEnq_D_IN;
	if (inPacket_EN) inPacket <= `BSV_ASSIGNMENT_DELAY inPacket_D_IN;
	if (memBuffer_serverAdapterA_cnt_EN)
	  memBuffer_serverAdapterA_cnt <= `BSV_ASSIGNMENT_DELAY
	      memBuffer_serverAdapterA_cnt_D_IN;
	if (memBuffer_serverAdapterA_s1_EN)
	  memBuffer_serverAdapterA_s1 <= `BSV_ASSIGNMENT_DELAY
	      memBuffer_serverAdapterA_s1_D_IN;
	if (memBuffer_serverAdapterA_s2_EN)
	  memBuffer_serverAdapterA_s2 <= `BSV_ASSIGNMENT_DELAY
	      memBuffer_serverAdapterA_s2_D_IN;
	if (memBuffer_serverAdapterB_cnt_EN)
	  memBuffer_serverAdapterB_cnt <= `BSV_ASSIGNMENT_DELAY
	      memBuffer_serverAdapterB_cnt_D_IN;
	if (memBuffer_serverAdapterB_s1_EN)
	  memBuffer_serverAdapterB_s1 <= `BSV_ASSIGNMENT_DELAY
	      memBuffer_serverAdapterB_s1_D_IN;
	if (memBuffer_serverAdapterB_s2_EN)
	  memBuffer_serverAdapterB_s2 <= `BSV_ASSIGNMENT_DELAY
	      memBuffer_serverAdapterB_s2_D_IN;
	if (outPacket_EN) outPacket <= `BSV_ASSIGNMENT_DELAY outPacket_D_IN;
	if (packetLen_EN) packetLen <= `BSV_ASSIGNMENT_DELAY packetLen_D_IN;
	if (rdCurrPtr_EN) rdCurrPtr <= `BSV_ASSIGNMENT_DELAY rdCurrPtr_D_IN;
	if (sopDeq_EN) sopDeq <= `BSV_ASSIGNMENT_DELAY sopDeq_D_IN;
	if (sopEnq_EN) sopEnq <= `BSV_ASSIGNMENT_DELAY sopEnq_D_IN;
	if (wrCurrPtr_EN) wrCurrPtr <= `BSV_ASSIGNMENT_DELAY wrCurrPtr_D_IN;
      end
    if (cf_verbosity_EN)
      cf_verbosity <= `BSV_ASSIGNMENT_DELAY cf_verbosity_D_IN;
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    cf_verbosity = 32'hAAAAAAAA;
    eopDeq = 64'hAAAAAAAAAAAAAAAA;
    eopEnq = 64'hAAAAAAAAAAAAAAAA;
    inPacket = 1'h0;
    memBuffer_serverAdapterA_cnt = 3'h2;
    memBuffer_serverAdapterA_s1 = 2'h2;
    memBuffer_serverAdapterA_s2 = 2'h2;
    memBuffer_serverAdapterB_cnt = 3'h2;
    memBuffer_serverAdapterB_s1 = 2'h2;
    memBuffer_serverAdapterB_s2 = 2'h2;
    outPacket = 1'h0;
    packetLen = 16'hAAAA;
    rdCurrPtr = 4'hA;
    sopDeq = 64'hAAAAAAAAAAAAAAAA;
    sopEnq = 64'hAAAAAAAAAAAAAAAA;
    wrCurrPtr = 4'hA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on

  // handling of system tasks

  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (memBuffer_serverAdapterA_s2[1] &&
	  !memBuffer_serverAdapterA_outDataCore_FULL_N)
	$display("ERROR: %m: mkBRAMSeverAdapter overrun");
    if (RST_N != `BSV_RESET_VALUE)
      if (memBuffer_serverAdapterB_s2[1] &&
	  !memBuffer_serverAdapterB_outDataCore_FULL_N)
	$display("ERROR: %m: mkBRAMSeverAdapter overrun");
  end
  // synopsys translate_on
endmodule  // mkPacketBuffer_64

