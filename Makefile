AS = nasm

all:
	$(AS) -i src/ src/main.s -o 8086ac.com
