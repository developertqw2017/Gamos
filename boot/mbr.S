;MBR
;
;LOADER_BASE_ADDR equ 0xA000
;LOADER_START_SECTOR equ 0x2
;----------------------------------------------
SECTION MBR vstart=0x7c00
    mov ax, cs
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov fs, ax
    mov sp, 0x7c00
    mov ax, 0xb800
    mov gs, ax

;清屏
;利用0x06号功能，上卷全部行，则可以清屏
    mov ax, 0600h
    mov bx, 0700h
    mov cx, 0
    mov dx, 184fh

    int 10h

    mov byte [gs:0x001],'1'
    mov byte [gs:0x001],0xA4
    
    mov byte [gs:0x002],' '

    mov byte [gs:0x003],'M'
    mov byte [gs:0x003],0xA4

    mov byte [gs:0x004],'B'
    mov byte [gs:0x004],0xA4

    mov byte [gs:0x005],'R'
    mov byte [gs:0x005],0xA4

    mov eax, LOADER_START_SECTOR
    mob bx, LOADER_BASE_ADDR
    MOV cx, 1
    call rd_disk_m_16

    jmp LOADER_BASE_ADDR

;-----------------------------------------
;功能:读取硬盘n个扇区
rd_disk_m_16:
;-----------------------------------------
    ; eax=LBA扇区号
    ; bx=将数据写入的内存地址
    ; cx=读入的扇区数

    mov esi, eax
    mov di, cx

