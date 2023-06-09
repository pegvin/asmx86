SOURCE=src
BUILD=build

all: $(SOURCE)/*
	@mkdir -p $(BUILD)

	$(eval DIRNAME=$(notdir $^))
	$(eval SOURCE=$(SOURCE)/$(DIRNAME)/main.asm)
	$(eval OUTPUT=$(BUILD)/$(DIRNAME).elf)

	@echo $(SOURCE) "->" $(OUTPUT)
	@nasm -f elf32 $(SOURCE) -o $(OUTPUT).o
	@ld -m elf_i386 $(OUTPUT).o -o $(OUTPUT)

clean:
	@$(RM) -rvf $(BUILD)

run: all
	@./build/myasm
