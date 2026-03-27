# Sequential Circuits: Latches

In this lab, you learned about the basic building block of sequential circuits: the latch.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Names
Rob Gonzalez
Orlando Godina

## Summary

In this lab, we learned how sequential logic differs from combinational logic because sequential circuits can store a value over time aka memory. We learned how a D-latch works by updating its output only when the enable signal is high, and otherwise holding its previous value. By combining everything together we also learned and implemented how memory is built from latches and how multiplexers and demultiplexers can be used to create a simple multi-byte memory system.

## Lab Questions

###  Why can we not just use structural Verilog to implement latches?
It is difficult to use structural verilog to implement latches because of timing and unpredictability.

### What is the meaning of always @(*) in a sensitivity block?
The meaning of always @(*) in a sensitivity block is to create a list that includes all the signals that are read in the block. This is done rather than listing all the input signals that trigger the block.
### What importance is memory to digital circuits?

Without memory, systems would react to inputs immediatley, and would not be able to keep track of prior inputs or save data. Memory is what allows for more advanced digital systems like most modern devices. Because of memory digital systems can save and store data to use later, enabling more complicated processess and allowing for more advanced logic.
