-- (c) Copyright 1995-2017 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:hls:sobel:1.0
-- IP Revision: 1706121729

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY arm_sobel_0_1 IS
  PORT (
    s_axi_AXILiteS_AWADDR : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    s_axi_AXILiteS_AWVALID : IN STD_LOGIC;
    s_axi_AXILiteS_AWREADY : OUT STD_LOGIC;
    s_axi_AXILiteS_WDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_AXILiteS_WSTRB : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axi_AXILiteS_WVALID : IN STD_LOGIC;
    s_axi_AXILiteS_WREADY : OUT STD_LOGIC;
    s_axi_AXILiteS_BRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_AXILiteS_BVALID : OUT STD_LOGIC;
    s_axi_AXILiteS_BREADY : IN STD_LOGIC;
    s_axi_AXILiteS_ARADDR : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    s_axi_AXILiteS_ARVALID : IN STD_LOGIC;
    s_axi_AXILiteS_ARREADY : OUT STD_LOGIC;
    s_axi_AXILiteS_RDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_AXILiteS_RRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_AXILiteS_RVALID : OUT STD_LOGIC;
    s_axi_AXILiteS_RREADY : IN STD_LOGIC;
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    interrupt : OUT STD_LOGIC;
    m_axi_INPUT_BUNDLE_AWADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_INPUT_BUNDLE_AWLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axi_INPUT_BUNDLE_AWSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_INPUT_BUNDLE_AWBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_INPUT_BUNDLE_AWLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_INPUT_BUNDLE_AWREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_INPUT_BUNDLE_AWCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_INPUT_BUNDLE_AWPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_INPUT_BUNDLE_AWQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_INPUT_BUNDLE_AWVALID : OUT STD_LOGIC;
    m_axi_INPUT_BUNDLE_AWREADY : IN STD_LOGIC;
    m_axi_INPUT_BUNDLE_WDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_INPUT_BUNDLE_WSTRB : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_INPUT_BUNDLE_WLAST : OUT STD_LOGIC;
    m_axi_INPUT_BUNDLE_WVALID : OUT STD_LOGIC;
    m_axi_INPUT_BUNDLE_WREADY : IN STD_LOGIC;
    m_axi_INPUT_BUNDLE_BRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_INPUT_BUNDLE_BVALID : IN STD_LOGIC;
    m_axi_INPUT_BUNDLE_BREADY : OUT STD_LOGIC;
    m_axi_INPUT_BUNDLE_ARADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_INPUT_BUNDLE_ARLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axi_INPUT_BUNDLE_ARSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_INPUT_BUNDLE_ARBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_INPUT_BUNDLE_ARLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_INPUT_BUNDLE_ARREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_INPUT_BUNDLE_ARCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_INPUT_BUNDLE_ARPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_INPUT_BUNDLE_ARQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_INPUT_BUNDLE_ARVALID : OUT STD_LOGIC;
    m_axi_INPUT_BUNDLE_ARREADY : IN STD_LOGIC;
    m_axi_INPUT_BUNDLE_RDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_INPUT_BUNDLE_RRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_INPUT_BUNDLE_RLAST : IN STD_LOGIC;
    m_axi_INPUT_BUNDLE_RVALID : IN STD_LOGIC;
    m_axi_INPUT_BUNDLE_RREADY : OUT STD_LOGIC;
    m_axi_OUTPUT_BUNDLE_AWADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_OUTPUT_BUNDLE_AWLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axi_OUTPUT_BUNDLE_AWSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_OUTPUT_BUNDLE_AWBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_OUTPUT_BUNDLE_AWLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_OUTPUT_BUNDLE_AWREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_OUTPUT_BUNDLE_AWCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_OUTPUT_BUNDLE_AWPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_OUTPUT_BUNDLE_AWQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_OUTPUT_BUNDLE_AWVALID : OUT STD_LOGIC;
    m_axi_OUTPUT_BUNDLE_AWREADY : IN STD_LOGIC;
    m_axi_OUTPUT_BUNDLE_WDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_OUTPUT_BUNDLE_WSTRB : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_OUTPUT_BUNDLE_WLAST : OUT STD_LOGIC;
    m_axi_OUTPUT_BUNDLE_WVALID : OUT STD_LOGIC;
    m_axi_OUTPUT_BUNDLE_WREADY : IN STD_LOGIC;
    m_axi_OUTPUT_BUNDLE_BRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_OUTPUT_BUNDLE_BVALID : IN STD_LOGIC;
    m_axi_OUTPUT_BUNDLE_BREADY : OUT STD_LOGIC;
    m_axi_OUTPUT_BUNDLE_ARADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_OUTPUT_BUNDLE_ARLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axi_OUTPUT_BUNDLE_ARSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_OUTPUT_BUNDLE_ARBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_OUTPUT_BUNDLE_ARLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_OUTPUT_BUNDLE_ARREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_OUTPUT_BUNDLE_ARCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_OUTPUT_BUNDLE_ARPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_OUTPUT_BUNDLE_ARQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_OUTPUT_BUNDLE_ARVALID : OUT STD_LOGIC;
    m_axi_OUTPUT_BUNDLE_ARREADY : IN STD_LOGIC;
    m_axi_OUTPUT_BUNDLE_RDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_OUTPUT_BUNDLE_RRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_OUTPUT_BUNDLE_RLAST : IN STD_LOGIC;
    m_axi_OUTPUT_BUNDLE_RVALID : IN STD_LOGIC;
    m_axi_OUTPUT_BUNDLE_RREADY : OUT STD_LOGIC
  );
END arm_sobel_0_1;

ARCHITECTURE arm_sobel_0_1_arch OF arm_sobel_0_1 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF arm_sobel_0_1_arch: ARCHITECTURE IS "yes";
  COMPONENT sobel IS
    GENERIC (
      C_S_AXI_AXILITES_ADDR_WIDTH : INTEGER;
      C_S_AXI_AXILITES_DATA_WIDTH : INTEGER;
      C_M_AXI_INPUT_BUNDLE_ID_WIDTH : INTEGER;
      C_M_AXI_INPUT_BUNDLE_ADDR_WIDTH : INTEGER;
      C_M_AXI_INPUT_BUNDLE_DATA_WIDTH : INTEGER;
      C_M_AXI_INPUT_BUNDLE_AWUSER_WIDTH : INTEGER;
      C_M_AXI_INPUT_BUNDLE_ARUSER_WIDTH : INTEGER;
      C_M_AXI_INPUT_BUNDLE_WUSER_WIDTH : INTEGER;
      C_M_AXI_INPUT_BUNDLE_RUSER_WIDTH : INTEGER;
      C_M_AXI_INPUT_BUNDLE_BUSER_WIDTH : INTEGER;
      C_M_AXI_INPUT_BUNDLE_USER_VALUE : INTEGER;
      C_M_AXI_INPUT_BUNDLE_PROT_VALUE : INTEGER;
      C_M_AXI_INPUT_BUNDLE_CACHE_VALUE : INTEGER;
      C_M_AXI_OUTPUT_BUNDLE_ID_WIDTH : INTEGER;
      C_M_AXI_OUTPUT_BUNDLE_ADDR_WIDTH : INTEGER;
      C_M_AXI_OUTPUT_BUNDLE_DATA_WIDTH : INTEGER;
      C_M_AXI_OUTPUT_BUNDLE_AWUSER_WIDTH : INTEGER;
      C_M_AXI_OUTPUT_BUNDLE_ARUSER_WIDTH : INTEGER;
      C_M_AXI_OUTPUT_BUNDLE_WUSER_WIDTH : INTEGER;
      C_M_AXI_OUTPUT_BUNDLE_RUSER_WIDTH : INTEGER;
      C_M_AXI_OUTPUT_BUNDLE_BUSER_WIDTH : INTEGER;
      C_M_AXI_OUTPUT_BUNDLE_USER_VALUE : INTEGER;
      C_M_AXI_OUTPUT_BUNDLE_PROT_VALUE : INTEGER;
      C_M_AXI_OUTPUT_BUNDLE_CACHE_VALUE : INTEGER
    );
    PORT (
      s_axi_AXILiteS_AWADDR : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      s_axi_AXILiteS_AWVALID : IN STD_LOGIC;
      s_axi_AXILiteS_AWREADY : OUT STD_LOGIC;
      s_axi_AXILiteS_WDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_AXILiteS_WSTRB : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axi_AXILiteS_WVALID : IN STD_LOGIC;
      s_axi_AXILiteS_WREADY : OUT STD_LOGIC;
      s_axi_AXILiteS_BRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_AXILiteS_BVALID : OUT STD_LOGIC;
      s_axi_AXILiteS_BREADY : IN STD_LOGIC;
      s_axi_AXILiteS_ARADDR : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      s_axi_AXILiteS_ARVALID : IN STD_LOGIC;
      s_axi_AXILiteS_ARREADY : OUT STD_LOGIC;
      s_axi_AXILiteS_RDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_AXILiteS_RRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_AXILiteS_RVALID : OUT STD_LOGIC;
      s_axi_AXILiteS_RREADY : IN STD_LOGIC;
      ap_clk : IN STD_LOGIC;
      ap_rst_n : IN STD_LOGIC;
      interrupt : OUT STD_LOGIC;
      m_axi_INPUT_BUNDLE_AWID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_INPUT_BUNDLE_AWADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_INPUT_BUNDLE_AWLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      m_axi_INPUT_BUNDLE_AWSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_INPUT_BUNDLE_AWBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_INPUT_BUNDLE_AWLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_INPUT_BUNDLE_AWREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_INPUT_BUNDLE_AWCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_INPUT_BUNDLE_AWPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_INPUT_BUNDLE_AWQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_INPUT_BUNDLE_AWUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_INPUT_BUNDLE_AWVALID : OUT STD_LOGIC;
      m_axi_INPUT_BUNDLE_AWREADY : IN STD_LOGIC;
      m_axi_INPUT_BUNDLE_WID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_INPUT_BUNDLE_WDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_INPUT_BUNDLE_WSTRB : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_INPUT_BUNDLE_WLAST : OUT STD_LOGIC;
      m_axi_INPUT_BUNDLE_WUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_INPUT_BUNDLE_WVALID : OUT STD_LOGIC;
      m_axi_INPUT_BUNDLE_WREADY : IN STD_LOGIC;
      m_axi_INPUT_BUNDLE_BID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_INPUT_BUNDLE_BRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_INPUT_BUNDLE_BUSER : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_INPUT_BUNDLE_BVALID : IN STD_LOGIC;
      m_axi_INPUT_BUNDLE_BREADY : OUT STD_LOGIC;
      m_axi_INPUT_BUNDLE_ARID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_INPUT_BUNDLE_ARADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_INPUT_BUNDLE_ARLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      m_axi_INPUT_BUNDLE_ARSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_INPUT_BUNDLE_ARBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_INPUT_BUNDLE_ARLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_INPUT_BUNDLE_ARREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_INPUT_BUNDLE_ARCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_INPUT_BUNDLE_ARPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_INPUT_BUNDLE_ARQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_INPUT_BUNDLE_ARUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_INPUT_BUNDLE_ARVALID : OUT STD_LOGIC;
      m_axi_INPUT_BUNDLE_ARREADY : IN STD_LOGIC;
      m_axi_INPUT_BUNDLE_RID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_INPUT_BUNDLE_RDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_INPUT_BUNDLE_RRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_INPUT_BUNDLE_RLAST : IN STD_LOGIC;
      m_axi_INPUT_BUNDLE_RUSER : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_INPUT_BUNDLE_RVALID : IN STD_LOGIC;
      m_axi_INPUT_BUNDLE_RREADY : OUT STD_LOGIC;
      m_axi_OUTPUT_BUNDLE_AWID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_OUTPUT_BUNDLE_AWADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_OUTPUT_BUNDLE_AWLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      m_axi_OUTPUT_BUNDLE_AWSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_OUTPUT_BUNDLE_AWBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_OUTPUT_BUNDLE_AWLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_OUTPUT_BUNDLE_AWREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_OUTPUT_BUNDLE_AWCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_OUTPUT_BUNDLE_AWPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_OUTPUT_BUNDLE_AWQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_OUTPUT_BUNDLE_AWUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_OUTPUT_BUNDLE_AWVALID : OUT STD_LOGIC;
      m_axi_OUTPUT_BUNDLE_AWREADY : IN STD_LOGIC;
      m_axi_OUTPUT_BUNDLE_WID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_OUTPUT_BUNDLE_WDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_OUTPUT_BUNDLE_WSTRB : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_OUTPUT_BUNDLE_WLAST : OUT STD_LOGIC;
      m_axi_OUTPUT_BUNDLE_WUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_OUTPUT_BUNDLE_WVALID : OUT STD_LOGIC;
      m_axi_OUTPUT_BUNDLE_WREADY : IN STD_LOGIC;
      m_axi_OUTPUT_BUNDLE_BID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_OUTPUT_BUNDLE_BRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_OUTPUT_BUNDLE_BUSER : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_OUTPUT_BUNDLE_BVALID : IN STD_LOGIC;
      m_axi_OUTPUT_BUNDLE_BREADY : OUT STD_LOGIC;
      m_axi_OUTPUT_BUNDLE_ARID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_OUTPUT_BUNDLE_ARADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_OUTPUT_BUNDLE_ARLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      m_axi_OUTPUT_BUNDLE_ARSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_OUTPUT_BUNDLE_ARBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_OUTPUT_BUNDLE_ARLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_OUTPUT_BUNDLE_ARREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_OUTPUT_BUNDLE_ARCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_OUTPUT_BUNDLE_ARPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_OUTPUT_BUNDLE_ARQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_OUTPUT_BUNDLE_ARUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_OUTPUT_BUNDLE_ARVALID : OUT STD_LOGIC;
      m_axi_OUTPUT_BUNDLE_ARREADY : IN STD_LOGIC;
      m_axi_OUTPUT_BUNDLE_RID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_OUTPUT_BUNDLE_RDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_OUTPUT_BUNDLE_RRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_OUTPUT_BUNDLE_RLAST : IN STD_LOGIC;
      m_axi_OUTPUT_BUNDLE_RUSER : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_OUTPUT_BUNDLE_RVALID : IN STD_LOGIC;
      m_axi_OUTPUT_BUNDLE_RREADY : OUT STD_LOGIC
    );
  END COMPONENT sobel;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_AXILiteS_AWADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_AXILiteS_AWVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_AXILiteS_AWREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_AXILiteS_WDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_AXILiteS_WSTRB: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_AXILiteS_WVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_AXILiteS_WREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_AXILiteS_BRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_AXILiteS_BVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_AXILiteS_BREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_AXILiteS_ARADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_AXILiteS_ARVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_AXILiteS_ARREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_AXILiteS_RDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_AXILiteS_RRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_AXILiteS_RVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_AXILiteS_RREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF ap_clk: SIGNAL IS "xilinx.com:signal:clock:1.0 ap_clk CLK";
  ATTRIBUTE X_INTERFACE_INFO OF ap_rst_n: SIGNAL IS "xilinx.com:signal:reset:1.0 ap_rst_n RST";
  ATTRIBUTE X_INTERFACE_INFO OF interrupt: SIGNAL IS "xilinx.com:signal:interrupt:1.0 interrupt INTERRUPT";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_INPUT_BUNDLE_AWADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_INPUT_BUNDLE_AWLEN: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE AWLEN";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_INPUT_BUNDLE_AWSIZE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE AWSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_INPUT_BUNDLE_AWBURST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE AWBURST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_INPUT_BUNDLE_AWLOCK: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE AWLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_INPUT_BUNDLE_AWREGION: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE AWREGION";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_INPUT_BUNDLE_AWCACHE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE AWCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_INPUT_BUNDLE_AWPROT: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_INPUT_BUNDLE_AWQOS: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE AWQOS";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_INPUT_BUNDLE_AWVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_INPUT_BUNDLE_AWREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_INPUT_BUNDLE_WDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_INPUT_BUNDLE_WSTRB: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_INPUT_BUNDLE_WLAST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE WLAST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_INPUT_BUNDLE_WVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_INPUT_BUNDLE_WREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_INPUT_BUNDLE_BRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_INPUT_BUNDLE_BVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_INPUT_BUNDLE_BREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_INPUT_BUNDLE_ARADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_INPUT_BUNDLE_ARLEN: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE ARLEN";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_INPUT_BUNDLE_ARSIZE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE ARSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_INPUT_BUNDLE_ARBURST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE ARBURST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_INPUT_BUNDLE_ARLOCK: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE ARLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_INPUT_BUNDLE_ARREGION: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE ARREGION";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_INPUT_BUNDLE_ARCACHE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE ARCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_INPUT_BUNDLE_ARPROT: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_INPUT_BUNDLE_ARQOS: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE ARQOS";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_INPUT_BUNDLE_ARVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_INPUT_BUNDLE_ARREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_INPUT_BUNDLE_RDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_INPUT_BUNDLE_RRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_INPUT_BUNDLE_RLAST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE RLAST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_INPUT_BUNDLE_RVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_INPUT_BUNDLE_RREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_OUTPUT_BUNDLE_AWADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_OUTPUT_BUNDLE_AWLEN: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE AWLEN";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_OUTPUT_BUNDLE_AWSIZE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE AWSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_OUTPUT_BUNDLE_AWBURST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE AWBURST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_OUTPUT_BUNDLE_AWLOCK: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE AWLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_OUTPUT_BUNDLE_AWREGION: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE AWREGION";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_OUTPUT_BUNDLE_AWCACHE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE AWCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_OUTPUT_BUNDLE_AWPROT: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_OUTPUT_BUNDLE_AWQOS: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE AWQOS";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_OUTPUT_BUNDLE_AWVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_OUTPUT_BUNDLE_AWREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_OUTPUT_BUNDLE_WDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_OUTPUT_BUNDLE_WSTRB: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_OUTPUT_BUNDLE_WLAST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE WLAST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_OUTPUT_BUNDLE_WVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_OUTPUT_BUNDLE_WREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_OUTPUT_BUNDLE_BRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_OUTPUT_BUNDLE_BVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_OUTPUT_BUNDLE_BREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_OUTPUT_BUNDLE_ARADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_OUTPUT_BUNDLE_ARLEN: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE ARLEN";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_OUTPUT_BUNDLE_ARSIZE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE ARSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_OUTPUT_BUNDLE_ARBURST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE ARBURST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_OUTPUT_BUNDLE_ARLOCK: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE ARLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_OUTPUT_BUNDLE_ARREGION: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE ARREGION";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_OUTPUT_BUNDLE_ARCACHE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE ARCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_OUTPUT_BUNDLE_ARPROT: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_OUTPUT_BUNDLE_ARQOS: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE ARQOS";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_OUTPUT_BUNDLE_ARVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_OUTPUT_BUNDLE_ARREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_OUTPUT_BUNDLE_RDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_OUTPUT_BUNDLE_RRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_OUTPUT_BUNDLE_RLAST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE RLAST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_OUTPUT_BUNDLE_RVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_OUTPUT_BUNDLE_RREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE RREADY";
BEGIN
  U0 : sobel
    GENERIC MAP (
      C_S_AXI_AXILITES_ADDR_WIDTH => 5,
      C_S_AXI_AXILITES_DATA_WIDTH => 32,
      C_M_AXI_INPUT_BUNDLE_ID_WIDTH => 1,
      C_M_AXI_INPUT_BUNDLE_ADDR_WIDTH => 32,
      C_M_AXI_INPUT_BUNDLE_DATA_WIDTH => 32,
      C_M_AXI_INPUT_BUNDLE_AWUSER_WIDTH => 1,
      C_M_AXI_INPUT_BUNDLE_ARUSER_WIDTH => 1,
      C_M_AXI_INPUT_BUNDLE_WUSER_WIDTH => 1,
      C_M_AXI_INPUT_BUNDLE_RUSER_WIDTH => 1,
      C_M_AXI_INPUT_BUNDLE_BUSER_WIDTH => 1,
      C_M_AXI_INPUT_BUNDLE_USER_VALUE => 0,
      C_M_AXI_INPUT_BUNDLE_PROT_VALUE => 0,
      C_M_AXI_INPUT_BUNDLE_CACHE_VALUE => 3,
      C_M_AXI_OUTPUT_BUNDLE_ID_WIDTH => 1,
      C_M_AXI_OUTPUT_BUNDLE_ADDR_WIDTH => 32,
      C_M_AXI_OUTPUT_BUNDLE_DATA_WIDTH => 32,
      C_M_AXI_OUTPUT_BUNDLE_AWUSER_WIDTH => 1,
      C_M_AXI_OUTPUT_BUNDLE_ARUSER_WIDTH => 1,
      C_M_AXI_OUTPUT_BUNDLE_WUSER_WIDTH => 1,
      C_M_AXI_OUTPUT_BUNDLE_RUSER_WIDTH => 1,
      C_M_AXI_OUTPUT_BUNDLE_BUSER_WIDTH => 1,
      C_M_AXI_OUTPUT_BUNDLE_USER_VALUE => 0,
      C_M_AXI_OUTPUT_BUNDLE_PROT_VALUE => 0,
      C_M_AXI_OUTPUT_BUNDLE_CACHE_VALUE => 3
    )
    PORT MAP (
      s_axi_AXILiteS_AWADDR => s_axi_AXILiteS_AWADDR,
      s_axi_AXILiteS_AWVALID => s_axi_AXILiteS_AWVALID,
      s_axi_AXILiteS_AWREADY => s_axi_AXILiteS_AWREADY,
      s_axi_AXILiteS_WDATA => s_axi_AXILiteS_WDATA,
      s_axi_AXILiteS_WSTRB => s_axi_AXILiteS_WSTRB,
      s_axi_AXILiteS_WVALID => s_axi_AXILiteS_WVALID,
      s_axi_AXILiteS_WREADY => s_axi_AXILiteS_WREADY,
      s_axi_AXILiteS_BRESP => s_axi_AXILiteS_BRESP,
      s_axi_AXILiteS_BVALID => s_axi_AXILiteS_BVALID,
      s_axi_AXILiteS_BREADY => s_axi_AXILiteS_BREADY,
      s_axi_AXILiteS_ARADDR => s_axi_AXILiteS_ARADDR,
      s_axi_AXILiteS_ARVALID => s_axi_AXILiteS_ARVALID,
      s_axi_AXILiteS_ARREADY => s_axi_AXILiteS_ARREADY,
      s_axi_AXILiteS_RDATA => s_axi_AXILiteS_RDATA,
      s_axi_AXILiteS_RRESP => s_axi_AXILiteS_RRESP,
      s_axi_AXILiteS_RVALID => s_axi_AXILiteS_RVALID,
      s_axi_AXILiteS_RREADY => s_axi_AXILiteS_RREADY,
      ap_clk => ap_clk,
      ap_rst_n => ap_rst_n,
      interrupt => interrupt,
      m_axi_INPUT_BUNDLE_AWADDR => m_axi_INPUT_BUNDLE_AWADDR,
      m_axi_INPUT_BUNDLE_AWLEN => m_axi_INPUT_BUNDLE_AWLEN,
      m_axi_INPUT_BUNDLE_AWSIZE => m_axi_INPUT_BUNDLE_AWSIZE,
      m_axi_INPUT_BUNDLE_AWBURST => m_axi_INPUT_BUNDLE_AWBURST,
      m_axi_INPUT_BUNDLE_AWLOCK => m_axi_INPUT_BUNDLE_AWLOCK,
      m_axi_INPUT_BUNDLE_AWREGION => m_axi_INPUT_BUNDLE_AWREGION,
      m_axi_INPUT_BUNDLE_AWCACHE => m_axi_INPUT_BUNDLE_AWCACHE,
      m_axi_INPUT_BUNDLE_AWPROT => m_axi_INPUT_BUNDLE_AWPROT,
      m_axi_INPUT_BUNDLE_AWQOS => m_axi_INPUT_BUNDLE_AWQOS,
      m_axi_INPUT_BUNDLE_AWVALID => m_axi_INPUT_BUNDLE_AWVALID,
      m_axi_INPUT_BUNDLE_AWREADY => m_axi_INPUT_BUNDLE_AWREADY,
      m_axi_INPUT_BUNDLE_WDATA => m_axi_INPUT_BUNDLE_WDATA,
      m_axi_INPUT_BUNDLE_WSTRB => m_axi_INPUT_BUNDLE_WSTRB,
      m_axi_INPUT_BUNDLE_WLAST => m_axi_INPUT_BUNDLE_WLAST,
      m_axi_INPUT_BUNDLE_WVALID => m_axi_INPUT_BUNDLE_WVALID,
      m_axi_INPUT_BUNDLE_WREADY => m_axi_INPUT_BUNDLE_WREADY,
      m_axi_INPUT_BUNDLE_BID => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_INPUT_BUNDLE_BRESP => m_axi_INPUT_BUNDLE_BRESP,
      m_axi_INPUT_BUNDLE_BUSER => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_INPUT_BUNDLE_BVALID => m_axi_INPUT_BUNDLE_BVALID,
      m_axi_INPUT_BUNDLE_BREADY => m_axi_INPUT_BUNDLE_BREADY,
      m_axi_INPUT_BUNDLE_ARADDR => m_axi_INPUT_BUNDLE_ARADDR,
      m_axi_INPUT_BUNDLE_ARLEN => m_axi_INPUT_BUNDLE_ARLEN,
      m_axi_INPUT_BUNDLE_ARSIZE => m_axi_INPUT_BUNDLE_ARSIZE,
      m_axi_INPUT_BUNDLE_ARBURST => m_axi_INPUT_BUNDLE_ARBURST,
      m_axi_INPUT_BUNDLE_ARLOCK => m_axi_INPUT_BUNDLE_ARLOCK,
      m_axi_INPUT_BUNDLE_ARREGION => m_axi_INPUT_BUNDLE_ARREGION,
      m_axi_INPUT_BUNDLE_ARCACHE => m_axi_INPUT_BUNDLE_ARCACHE,
      m_axi_INPUT_BUNDLE_ARPROT => m_axi_INPUT_BUNDLE_ARPROT,
      m_axi_INPUT_BUNDLE_ARQOS => m_axi_INPUT_BUNDLE_ARQOS,
      m_axi_INPUT_BUNDLE_ARVALID => m_axi_INPUT_BUNDLE_ARVALID,
      m_axi_INPUT_BUNDLE_ARREADY => m_axi_INPUT_BUNDLE_ARREADY,
      m_axi_INPUT_BUNDLE_RID => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_INPUT_BUNDLE_RDATA => m_axi_INPUT_BUNDLE_RDATA,
      m_axi_INPUT_BUNDLE_RRESP => m_axi_INPUT_BUNDLE_RRESP,
      m_axi_INPUT_BUNDLE_RLAST => m_axi_INPUT_BUNDLE_RLAST,
      m_axi_INPUT_BUNDLE_RUSER => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_INPUT_BUNDLE_RVALID => m_axi_INPUT_BUNDLE_RVALID,
      m_axi_INPUT_BUNDLE_RREADY => m_axi_INPUT_BUNDLE_RREADY,
      m_axi_OUTPUT_BUNDLE_AWADDR => m_axi_OUTPUT_BUNDLE_AWADDR,
      m_axi_OUTPUT_BUNDLE_AWLEN => m_axi_OUTPUT_BUNDLE_AWLEN,
      m_axi_OUTPUT_BUNDLE_AWSIZE => m_axi_OUTPUT_BUNDLE_AWSIZE,
      m_axi_OUTPUT_BUNDLE_AWBURST => m_axi_OUTPUT_BUNDLE_AWBURST,
      m_axi_OUTPUT_BUNDLE_AWLOCK => m_axi_OUTPUT_BUNDLE_AWLOCK,
      m_axi_OUTPUT_BUNDLE_AWREGION => m_axi_OUTPUT_BUNDLE_AWREGION,
      m_axi_OUTPUT_BUNDLE_AWCACHE => m_axi_OUTPUT_BUNDLE_AWCACHE,
      m_axi_OUTPUT_BUNDLE_AWPROT => m_axi_OUTPUT_BUNDLE_AWPROT,
      m_axi_OUTPUT_BUNDLE_AWQOS => m_axi_OUTPUT_BUNDLE_AWQOS,
      m_axi_OUTPUT_BUNDLE_AWVALID => m_axi_OUTPUT_BUNDLE_AWVALID,
      m_axi_OUTPUT_BUNDLE_AWREADY => m_axi_OUTPUT_BUNDLE_AWREADY,
      m_axi_OUTPUT_BUNDLE_WDATA => m_axi_OUTPUT_BUNDLE_WDATA,
      m_axi_OUTPUT_BUNDLE_WSTRB => m_axi_OUTPUT_BUNDLE_WSTRB,
      m_axi_OUTPUT_BUNDLE_WLAST => m_axi_OUTPUT_BUNDLE_WLAST,
      m_axi_OUTPUT_BUNDLE_WVALID => m_axi_OUTPUT_BUNDLE_WVALID,
      m_axi_OUTPUT_BUNDLE_WREADY => m_axi_OUTPUT_BUNDLE_WREADY,
      m_axi_OUTPUT_BUNDLE_BID => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_OUTPUT_BUNDLE_BRESP => m_axi_OUTPUT_BUNDLE_BRESP,
      m_axi_OUTPUT_BUNDLE_BUSER => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_OUTPUT_BUNDLE_BVALID => m_axi_OUTPUT_BUNDLE_BVALID,
      m_axi_OUTPUT_BUNDLE_BREADY => m_axi_OUTPUT_BUNDLE_BREADY,
      m_axi_OUTPUT_BUNDLE_ARADDR => m_axi_OUTPUT_BUNDLE_ARADDR,
      m_axi_OUTPUT_BUNDLE_ARLEN => m_axi_OUTPUT_BUNDLE_ARLEN,
      m_axi_OUTPUT_BUNDLE_ARSIZE => m_axi_OUTPUT_BUNDLE_ARSIZE,
      m_axi_OUTPUT_BUNDLE_ARBURST => m_axi_OUTPUT_BUNDLE_ARBURST,
      m_axi_OUTPUT_BUNDLE_ARLOCK => m_axi_OUTPUT_BUNDLE_ARLOCK,
      m_axi_OUTPUT_BUNDLE_ARREGION => m_axi_OUTPUT_BUNDLE_ARREGION,
      m_axi_OUTPUT_BUNDLE_ARCACHE => m_axi_OUTPUT_BUNDLE_ARCACHE,
      m_axi_OUTPUT_BUNDLE_ARPROT => m_axi_OUTPUT_BUNDLE_ARPROT,
      m_axi_OUTPUT_BUNDLE_ARQOS => m_axi_OUTPUT_BUNDLE_ARQOS,
      m_axi_OUTPUT_BUNDLE_ARVALID => m_axi_OUTPUT_BUNDLE_ARVALID,
      m_axi_OUTPUT_BUNDLE_ARREADY => m_axi_OUTPUT_BUNDLE_ARREADY,
      m_axi_OUTPUT_BUNDLE_RID => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_OUTPUT_BUNDLE_RDATA => m_axi_OUTPUT_BUNDLE_RDATA,
      m_axi_OUTPUT_BUNDLE_RRESP => m_axi_OUTPUT_BUNDLE_RRESP,
      m_axi_OUTPUT_BUNDLE_RLAST => m_axi_OUTPUT_BUNDLE_RLAST,
      m_axi_OUTPUT_BUNDLE_RUSER => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_OUTPUT_BUNDLE_RVALID => m_axi_OUTPUT_BUNDLE_RVALID,
      m_axi_OUTPUT_BUNDLE_RREADY => m_axi_OUTPUT_BUNDLE_RREADY
    );
END arm_sobel_0_1_arch;
