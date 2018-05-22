##操作系统 FreeBSD

学习FreeBSD的目的是为了了解**图形API**以及**TCP/IP协议栈在该操作系统上实现的细节**，最终为了我的游戏专用操作系统开发图形API以及一个游戏引擎。

目录

- 第一卷 

  1. FreeBSD系统结构篇
  2. FreeBSD实现（TCP/IP,Graph API）
  3. 在游戏主机上的专用操作系统

  







FreeBSD 源码分析



FreeBSD arch手册中，提到 引导过程与内核初始化时，loader阶段 屏幕提示信息为

```
BTX loader 1.0 BTX version is 1.01
BIOS drive A: is disk0
BIOS drive C: is disk1
BIOS 639kB/64512kB available memory
FreeBSD/i386 bootstrap loader, Revision 0.8
Console internal video/keyboard
(jkh@bento.freebsd.org, Mon Nov 20 11:41:23 GMT 2000)
/kernel text=0x1234 data=0x2345 syms=[0x4+0x3456]
Hit [Enter] to boot immediately, or any other key for command prompt
Booting [kernel] in 9 seconds..._
```



BTX 是主板的型号 

2006年，由于与ATX的兼容问题和产业换代成本过高，BTX规范被Intel放弃。 













中断发生后OS底层工作步骤

1.硬件压栈：程序计数器等

2.硬件从中断向量装入新的程序计数器等

3.汇编语言过程保存寄存器值

4.汇编语言过程设置新的堆栈

5.c语言中断服务程序运行

6.进程调度程序决定下一个将运行的进程

7.C语言过程返回至汇编代码

8.汇编语言过程开始运行新的当前进程





进程的定义



定义：process

进程是具有独立功能的程序关于某个数据集合上的一次运行活动，是系统进行资源分配和调度的独立单位。

- 程序的一次执行过程
- 是正在运行的程序的抽象
- 将一个cpu变换成多个虚拟的CPU
- 系统资源以进程为单位分配，如内存，文件， 每个具有独立的地址空间
- 操作系统将CPU调度给需要的进程

进程控制块PCB

又称 进程描述符、进程属性

PCB：Process Control Block

操作系统用于管理控制进程的一个专门的数据结构

记录进程的各种属性，描述进程的动态变化过程

PCB是系统感知进程存在的唯一标志

- 进程与PCB是一一对应的

进程表：所有进程的PCB的集合



PCB应该包含什么内容呢？

1.对进程有一些基本信息的描述

进程是运动变化的，所以我们需要一些控制操作，需要一些控制信息，进程在运行过程中吗，需要一些资源，资源在运行过程中的使用情况需要记录下来，另外在进程控制块中，还要保存CPU的现场信息，

四类信息

1. 进程描述信息 
   - 进程标识符，唯一，通常是一个是一个整数。
   - 进程名，通常基于可执行文件名，不唯一。
   - 用户标识符
   - 进程组关系
2. 进程控制信息
   - 当前状态
   - 优先级
   - 代码执行入口地址
   - 程序的磁盘地址
   - 运行统计信息（执行时间，页面调度）
   - 进程间同步和通信
   - 进程的队列指针
   - 进程的消息队列指针
3. 所拥有的资源和使用情况
   - 虚拟地址空间的状况
   - 打开文件列表
4. CPU现场信息
   - 寄存器值（通用寄存器，程序计数器PC，程序状态字PSW，栈指针）
   - 指向该进程页表的指针

进程管理进程控制块会用到的信息

```
Process management
Registers
Program counter
PRogram status word
Stack pointer
Process state
Priority
Scheduling parameters
Process ID
Parent process
Process group
Signals
Time when process started
CPU time used
Children's CPU time
Time of next alarm
```



存储管理进程控制块会用到的信息

```
Memory management
Pointer to next segment
Pointer to data segment
Pointer to stack segment
```



文件管理会进程控制块用到的信息

```
File management
Root directory
Working directory
File descriptions
User ID
Group ID
```

Linux:task_struct

Windows: EPROCESS、KPROESS、PEB







-----

参考书籍

 <<FreeBSD handbook>>

<<FreeBSD 系统结构手册>>