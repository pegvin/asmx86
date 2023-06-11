SOURCES=$(wildcard src/**/main.asm)
BUILD=build

OBJECTS=$(SOURCES:.asm=.o)

%.o: %.asm
	@mkdir -p $(BUILD)
	$(eval DIRNAME=$(notdir $(realpath $(dir $<))))
	$(eval OUTPUT=$(BUILD)/$(DIRNAME).elf)
	@echo $< "->" $(OUTPUT)
	@nasm -f elf32 $< -o $(OUTPUT).o
	@ld -L/usr/lib32/ -L/libx32 -lc -e _start -dynamic-linker /lib/ld-linux.so.2 -m elf_i386 $(OUTPUT).o -o $(OUTPUT)

all: $(OBJECTS)

clean:
	@$(RM) -rvf $(BUILD)

run: all
	@./build/myasm
