AS:=nasm
LD:=ld

A_FLAGS:=-felf64
LD_FLAGS:=

ODIR     = build
BIN      = main.elf
SRCS_ASM = $(wildcard src/*.asm)
OBJECTS  = $(SRCS_ASM:.asm=.o)
OBJECTS := $(patsubst %,$(ODIR)/%,$(OBJECTS))
DEPENDS := $(OBJECTS:.o=.d)

-include $(DEPENDS)

$(ODIR)/%.o: %.asm
	@echo "AS  -" $<
	@mkdir -p "$$(dirname "$@")"
	@$(AS) $< -MD $($@:.o=.d) -o $@ $(A_FLAGS)

$(BIN): $(OBJECTS)
	@echo Linking $@
	@$(LD) -o $@ $(OBJECTS) $(LD_FLAGS)

all: $(BIN)

clean:
	@$(RM) -r $(BIN) $(ODIR) $(DEPENDS)
	@echo - Cleaned
