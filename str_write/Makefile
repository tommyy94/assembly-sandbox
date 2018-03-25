TARGET = $(lastword $(subst /, ,$(CURDIR)))
CFLAGS = -f elf32 -g -F dwarf

$(TARGET): $(TARGET).o
	ld -m elf_i386 -o $(TARGET) $(TARGET).o
$(TARGET).o: $(TARGET).asm
	nasm $(CFLAGS) $(TARGET).asm -l $(TARGET).lst
clean:
	rm -f $(TARGET).lst $(TARGET).o $(TARGET)
run:
	./$(TARGET)

