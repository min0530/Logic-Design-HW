VERIOG = iverilog
TARGET = voter_if.vcd

$(TARGET) : simple.vvp
	vvp simple.vvp

simple.vvp: voter_if_tb.v voter_if.v
	$(VERIOG) -o simple.vvp voter_if_tb.v voter_if.v

clean:
	rm $(TARGET)
