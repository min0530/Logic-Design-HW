VERIOG = iverilog
TARGET = BCD.vcd

$(TARGET) : simple.vvp
	vvp simple.vvp

simple.vvp: BCD_tb.v BCD.v
	$(VERIOG) -o simple.vvp BCD_tb.v BCD.v

clean:
	rm $(TARGET)
