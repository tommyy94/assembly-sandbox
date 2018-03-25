TARGET = $(name)/$(name)
CFLAGS = -f elf32 -g -F dwarf

all: $(TARGET).o
	ld -m elf_i386 -o $(TARGET) $(TARGET).o
	
$(TARGET).o: $(TARGET).asm
	nasm $(CFLAGS) $(TARGET).asm -l $(TARGET).lst
	
.PHONY: clean
clean:
	rm -f $(TARGET).lst $(TARGET).o $(TARGET)
	
help:
	@echo "usage: make name = [target directory] all/clean/run"
	
run:
	./$(TARGET)

