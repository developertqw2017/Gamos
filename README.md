- ./boot/mbr.S
MBR（主引导程序）
1. 将MBR载入0x7c00开始的内存
2. 读取硬盘n个扇区

- ./tools/xxd.sh
查看二进制文件脚本
使用工具xxd 集合参数
Usage: xxd [filename] [start byte] [end byte]
