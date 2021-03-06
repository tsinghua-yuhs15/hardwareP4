
set partname {xc7k325tffg900-2}
set boardname {kc705}
## for compatibility with older fpgamake. will be removed.
set xbsvipdir {/home/netarchlab/connectalip}
set ipdir {/home/netarchlab/connectalip}
set connectaldir {/home/netarchlab/p4fpga/connectal}
set need_pcie {x7_gen1x8}
set connectal_dut {mkPcieTop}
set PARSER {Parser}
set DEPARSER {Deparser}
set MATCHTABLE {Control}
set TYPEDEF {StructDefines}
set NUM_RXCHAN {1}
set NUM_TXCHAN {1}
set NUM_HOSTCHAN {1}
set STREAM {}
set NUM_RXCHAN {1}
set NUM_TXCHAN {1}
set NUM_HOSTCHAN {1}
set NUM_METAGEN {1}
set NUM_PKTGEN {1}
set STREAM {}
set NicVersion {2778269842}
set DataBusWidth {128}
set IMPORT_HOSTIF {}
set BYTE_ENABLES {}
set ClockDefaultParam {}
set ConnectalVersion {17.01.2}
set NumberOfMasters {1}
set PinType {Empty}
set PinTypeInclude {Misc}
set NumberOfUserTiles {1}
set SlaveDataBusWidth {32}
set SlaveControlAddrWidth {5}
set BurstLenSize {12}
set project_dir {$(DTOP)}
set MainClockPeriod {8}
set DerivedClockPeriod {4.000000}
set PcieClockPeriod {8}
set XILINX {1}
set Kintex7 {}
set PCIE {}
set PCIE1 {}
set PcieHostInterface {}
set PhysAddrWidth {40}
set PcieLanes {8}
set CONNECTAL_BITS_DEPENDENCES {hw/mkTop.bit}
set CONNECTAL_RUN_SCRIPT {$(CONNECTALDIR)/scripts/run.pcietest}
set BOARD_kc705 {}
