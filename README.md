# 基于Vue和SpringBoot的大病保险管理系统     

## 软件技术栈    
**唠嗑几句，本项目是一个毕业设计，用来模拟就医和医保报销的过程。Vue确实强大，一直用一直爽哈哈哈**     
- 前端：Vue、View UI
- 后端：SpringBoot、MybatisPlus、SpringSecurity
- 数据库：MySql8.0、Redis（用来做缓存）
    
## 介绍
基于Vue和SpringBoot的大病保险管理系统，前端采用View UI组件库，后端集成MyBatisPlus连接MySQL数据库，采用Spring Security做权限控制。    
整个系统分为系统基础、参保人员档案模块、保险档案模块、就医登记模块、报销审核模块 四大模块    


- 参保人员档案模块：对参保人员基础信息进行维护，包括社保卡的余额    
- 保险档案模块：对不同的医疗保险，对各类的药物、手术费报销比例、上限进行维护。    
- 就医登记模块：参保人员每次挂号，记录各类费用，并根据该人的医保进行自动报销，扣除社保余额    
- 报销审核模块：保险公司审核保险  

## 界面预览  

### 登入页面      
![登入页面](https://images.gitee.com/uploads/images/2021/0614/111228_3154bd28_7525468.png "111.png")
### 首页      
![首页](https://images.gitee.com/uploads/images/2021/0614/111249_d52f1109_7525468.png "222.png")
### 人员档案      
![人员档案](https://images.gitee.com/uploads/images/2021/0614/111302_5996cc96_7525468.png "333.png")
### 医保卡充值      
![医保卡充值](https://images.gitee.com/uploads/images/2021/0614/111314_87f32f8c_7525468.png "444.png")
### 医保档案      
![医保档案](https://images.gitee.com/uploads/images/2021/0614/111330_9e62c9fa_7525468.png "555.png")
### 手术档案      
![手术档案](https://images.gitee.com/uploads/images/2021/0614/111344_17183730_7525468.png "666.png")
### 看病登记      
![看病登记](https://images.gitee.com/uploads/images/2021/0614/111359_8cfad218_7525468.png "777.png")
### 新增看病登记      
![新增看病登记](https://images.gitee.com/uploads/images/2021/0614/111412_8b00c7ee_7525468.png "888.png")
### 报销审核      
![报销审核](https://images.gitee.com/uploads/images/2021/0614/111425_315da39d_7525468.png "999.png")


## 安装教程

1.本机安装GIT，输入命令
```java
git clone https://gitee.com/yyzwz/medicineSystem.git
```
2.前端使用VsCode打开front文件夹，控制台输入npm i 安装依赖

3.前端控制台输入npm run dev 运行（默认8080端口）

4.控制台cd到redis目录，运行以下命令
```java
redis-server.exe redis.windows.conf
```
5.导入数据库（medicine.sql）

6.使用idea导入back后端项目，maven方式导入，运行(默认8888端口)！

7.运行项目，账号admin 密码123456

### 欢迎光临我的博客：https://zwz99.blog.csdn.net/   
![我的CSDN博客](https://images.gitee.com/uploads/images/2021/0604/100703_32e14138_7525468.jpeg "132246_599dbf21_7525468.jpeg")
