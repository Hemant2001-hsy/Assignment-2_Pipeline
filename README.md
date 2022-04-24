# Assignment-2__pipeline
Pipeline Verilog code with testbench

Consider a pipeline that carries out the following stage-wise operations:

Inputs: Three register addresses (rs1, rs2 and rd), an ALU function (func), and a memory address (addr).

Stage 1: Read two 16-bit numbers from the registers specified by "rs1" and "rs2", and store them in A and B.

Stage 2: Perform an ALU operation on A and B specified by "func", and store it in Z.

Stage 3: Write the value of Z in the register specified by "rd".

Stage 4: Also write the value of Z in memory location "addr".

The Assumptions:
There is a register bank containing 16 16-bit registers.

4-bits are required to specify a register address. 2 register reads and 1 register write can be performed every clock cycle.

Register addresses are "rs1", "rs2", and "rd".

Assume that the memory is organized as 256 x 16.

8-bits are required to specify memory address.

Every memory location contains 16 bits of data, which can be read in a single clock cycle.

Memory address specified as "addr".
