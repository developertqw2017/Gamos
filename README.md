- ./boot/mbr.S
MBR（主引导程序）
1. 将MBR载入0x7c00开始的内存
2. 读取硬盘n个扇区

- ./tools/xxd.sh
查看二进制文件脚本
使用工具xxd 集合参数
Usage: xxd [filename] [start byte] [end byte]


BIOS post
当PC加电后，处理器的寄存器被设为某些特定值。在这些寄存器中，指令指针寄存器指令指针寄存器被设为32位值0xfffffff0。指令指针寄存器指向处理器将要执行的指令代码。crl，一个32位控制寄存器，在刚启动时值被设为0。cr1的PE(Protected Enabled,保护模式)位用来指示处理器是位于保护模式还是实模式。由于启动时该位被清位，处理器在
