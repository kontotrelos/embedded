#include "xparameters.h"
#include "xgpio.h"
#include "led_ip.h"
//====================================================
#define N 20
void CPU_test(int X[],int Y[]);
void FPGA_test(int X[N], int Y[N]);
int main (void)
{
	  xil_printf("-- Start of the Program --\r\n");
	  xil_printf("-- idle --\r %x \n", LED_IP_mReadReg(XPAR_LED_IP_S_AXI_BASEADDR,LED_IP_S_AXI_SLV_REG2_OFFSET));
	  int X[N];
	  int Y1[N];
	  int Y2[N];
	  int i=0;
	  xil_printf("-- Start of the Program2 --\r\n");
	  for (i=0; i<N ; i++) {
		  X[i]=i;
	  }
	  xil_printf("-- Start of the Program3 --\r\n");
	  CPU_test(X,Y1);
	  xil_printf("-- Start of the Program4 --\r\n");
	  FPGA_test(X,Y2);

	  xil_printf("-- Program End --\r\n %x", Y2[2]);
	  xil_printf("-- Program End --\r\n %x", Y2[10]);
}

void CPU_test(int X[],int Y[]){
	int i;
	  for (i=0; i<N ; i++) {
		  Y[N]=X[i]*X[i];
	  }
	return;
}

void FPGA_test(int X[], int Y[]) {
	  int i;
	  xil_printf("-- idle --\r %x \n", LED_IP_mReadReg(XPAR_LED_IP_S_AXI_BASEADDR,LED_IP_S_AXI_SLV_REG2_OFFSET));
	  LED_IP_mWriteReg(XPAR_LED_IP_S_AXI_BASEADDR, LED_IP_S_AXI_SLV_REG3_OFFSET, 1); //start accelerator

	  xil_printf("-- receive LENGTH --\r %x \n", LED_IP_mReadReg(XPAR_LED_IP_S_AXI_BASEADDR,LED_IP_S_AXI_SLV_REG2_OFFSET));
	  LED_IP_mWriteReg(XPAR_LED_IP_S_AXI_BASEADDR,0,N); //sent array size info
	  //xil_printf("-- receive LENGTH1 --\r %x \n", LED_IP_mReadReg(XPAR_LED_IP_S_AXI_BASEADDR,LED_IP_S_AXI_SLV_REG2_OFFSET));
	  LED_IP_mWriteReg(XPAR_LED_IP_S_AXI_BASEADDR, LED_IP_S_AXI_SLV_REG3_OFFSET, 2);
	 // xil_printf("-- receive LENGTH1 --\r %x \n", LED_IP_mReadReg(XPAR_LED_IP_S_AXI_BASEADDR,LED_IP_S_AXI_SLV_REG2_OFFSET));

	  xil_printf("-- receive vector --\r %x \n", LED_IP_mReadReg(XPAR_LED_IP_S_AXI_BASEADDR,LED_IP_S_AXI_SLV_REG2_OFFSET));
	  for (i=0; i<=N ; i++) {							  //sent input vector X
	  	  LED_IP_mWriteReg(XPAR_LED_IP_S_AXI_BASEADDR, 0, X[i]);
	  	  LED_IP_mWriteReg(XPAR_LED_IP_S_AXI_BASEADDR, LED_IP_S_AXI_SLV_REG3_OFFSET, i);
		  xil_printf("-- receive vector --\r %x %d\n", LED_IP_mReadReg(XPAR_LED_IP_S_AXI_BASEADDR,LED_IP_S_AXI_SLV_REG2_OFFSET),i);

	  }


	  LED_IP_mWriteReg(XPAR_LED_IP_S_AXI_BASEADDR, LED_IP_S_AXI_SLV_REG3_OFFSET, 1); //start computation
	  xil_printf("-- waitin --\r %x \n", LED_IP_mReadReg(XPAR_LED_IP_S_AXI_BASEADDR,LED_IP_S_AXI_SLV_REG2_OFFSET));
	  //xil_printf("-- Stdam2 --\r %x \n", LED_IP_mReadReg(XPAR_LED_IP_S_AXI_BASEADDR,LED_IP_S_AXI_SLV_REG2_OFFSET));
	 // LED_IP_mWriteReg(XPAR_LED_IP_S_AXI_BASEADDR, 0, 0); //start computation

	 // xil_printf("-- Stdam3 --\r %x \n", LED_IP_mReadReg(XPAR_LED_IP_S_AXI_BASEADDR,LED_IP_S_AXI_SLV_REG2_OFFSET));
	  for (i=0; i<99999999; i++);
	  //while(!LED_IP_mReadReg(XPAR_LED_IP_S_AXI_BASEADDR,LED_IP_S_AXI_SLV_REG2_OFFSET)) {} //freeze while accelerator computes the result
	  //xil_printf("-- Stdam4 --\r %x \n", LED_IP_mReadReg(XPAR_LED_IP_S_AXI_BASEADDR,LED_IP_S_AXI_SLV_REG2_OFFSET));
	  for (i=0; i<N ; i++) {
		  LED_IP_mWriteReg(XPAR_LED_IP_S_AXI_BASEADDR, LED_IP_S_AXI_SLV_REG3_OFFSET, i);//receive output vector Y
		  Y[i]=LED_IP_mReadReg(XPAR_LED_IP_S_AXI_BASEADDR,LED_IP_S_AXI_SLV_REG1_OFFSET);
		  xil_printf("-- mesa --\r %d %d\n", i,Y[i]);

	  }
	  xil_printf("-- Stdam5 --\r %x \n");
	  //reading the value of grayout,  LED_IP_S_AXI_SLV_REG1_OFFSET=4  4*8bytes after slv1


	  //xil_printf("Current counter value: %x\r\n", LED_IP_mReadReg(XPAR_LED_IP_S_AXI_BASEADDR,LED_IP_S_AXI_SLV_REG1_OFFSET) );
	  return;
}