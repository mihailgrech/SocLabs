module task2(x, y, z, f);
	input x, y, z;
	output f;
    
	assign f = x | (y&z);
endmodule
