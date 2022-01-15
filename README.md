# 基于Vue的大病保险管理系统

<p align="center">
     | | __ ___   ____ _ <br>
 _   | |/ _` \ \ / / _` |<br>
| |__| | (_| |\ V / (_| |<br>
 \____/ \__,_| \_/ \__,_|<br>
</p>


![](https://img.shields.io/badge/build-passing-brightgreen) ![](https://img.shields.io/badge/progress-100%25-blue) ![](https://img.shields.io/badge/%E5%BC%80%E5%8F%91%E8%BF%9B%E5%BA%A6-99%25-success)

## 作者有话说

**唠嗑几句，本项目是一个基于Vue和SpringBoot的城乡居民大病保险管理系统。**    

**主要包含系统配置维护、系统参保管理、大病保险管理、大病登记管理、保险审核管理五大模块，用来模拟就医和医保报销的过程。**  

Vue确实强大，比ExtJS好用多了，一直用一直爽哈哈哈！

所用技术如下：

- 前端：Vue、View UI（组件库）
- 后端：SpringBoot、MybatisPlus(后端连数据库)、SpringSecurity（系统认证、授权）
- 数据库：MySql8、Redis（缓存）

## 登陆界面：

进入系统，首先看到登入界面，用户可以输入自己的账号、密码，进行登入操作。

登陆页面包含账号密码和手机号码两个选择来进行登录。输入账号、密码和验证码后点击登陆，即可登陆系统，此处账号密码不能为空，如果

密码输入错误，系统将进行密码错误提示，不能登陆系统，如果验证码过期，则需要重新获取验证。

此系统用于三类人群进行登陆、使用，分别是管理员、医生、保险审核员。

首先是管理员，对医保卡进行充值、对医院医生和保险公司业务员的账号、角色、权限进行配置是他的主要职责。此外可以操作日志，对数据字典进行维护；医院医生最主要职责就是对就医的患者进行看病登记；保险审核员则是发布医保信息，对参保人员的档案进行维护，各类手术的报销比例由他们来规定，以及医保报销审核通过与否由审核员决定。

![在这里插入图片描述](https://img-blog.csdnimg.cn/106b5f46326d449ab1d2cb8ec20c51b0.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6YOR5Li65Lit,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


用户也可以选择使用短信验证码方式进行登陆系统。（需要自行购买腾讯云短信服务）

![在这里插入图片描述](https://img-blog.csdnimg.cn/d007ba3250fc49a19749b4c8fc972975.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6YOR5Li65Lit,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


如果用户没有输入账号、密码或验证码，点击登陆按钮，系统会给与提示。

![在这里插入图片描述](https://img-blog.csdnimg.cn/a0a8c2d9b4a348cb9f938e1574a35dbf.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6YOR5Li65Lit,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


如果用户账号密码填写错误，系统给与提示，直到输入正确通过系统效验。

![在这里插入图片描述](https://img-blog.csdnimg.cn/38ae9bbf0b3d4fbcab0273cac8c5420e.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6YOR5Li65Lit,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


如果用户输入错误的验证码，系统也会给与提示，要求重新输入

![在这里插入图片描述](https://img-blog.csdnimg.cn/0fc40ffd61dd498e9e3c98919ade3926.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6YOR5Li65Lit,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)



## 首页：

登入成功后，进入到系统的首页，顶部是系统的标题栏，用于显示系统“大病保险”的图标和一级菜单，左侧是二级、三级菜单栏，用于存放用户拥有权限的菜单列表，右下角为主区域，存放了带背景图的系统首页。

![在这里插入图片描述](https://img-blog.csdnimg.cn/ff8755673c184f4d893adf75f1536f4e.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6YOR5Li65Lit,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


可以点击右侧滑动的按钮，进行切换图片操作

![在这里插入图片描述](https://img-blog.csdnimg.cn/c25aeb13074b4621b167a690a3c92667.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6YOR5Li65Lit,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


可以点击左侧滑动的按钮，进行切换图片操作

![在这里插入图片描述](https://img-blog.csdnimg.cn/95e72ca7af5f46af9b77f10a9a058142.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6YOR5Li65Lit,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


本系统使用了当下热门的View UI组件库，该组件库基于Vue这一主流前端技术框架进行编程开发。大病保险管理系统的主页包括上导航页、左侧子页面以及中间模块显示区域。中间模块显示区域设置了banner，在没有进入具体模块时，该区域的背景的图片会定时进行切换。背景图片为本人日常随拍，无特殊意义。

## 修改密码：
登入成功后，用户可以自助修改自己的密码。点击右上角的修改密码按钮，

![在这里插入图片描述](https://img-blog.csdnimg.cn/5ef65966ac2048bc98a171d2bc55fce6.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6YOR5Li65Lit,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)



出现修改密码弹框，用户可以再次输入自己的新密码，完成账户密码修改。

![在这里插入图片描述](https://img-blog.csdnimg.cn/2ea18397d3e0480fa6d1c43b5b0c9268.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6YOR5Li65Lit,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


## 用户管理模块：

登入成功后，有权限的用户可以进入登入用户管理模块。

![在这里插入图片描述](https://img-blog.csdnimg.cn/8c2877f0c78644b5a1ad6495a089d445.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6YOR5Li65Lit,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


用户可以点击“添加用户”按钮，在弹框中完成用户的添加。

![在这里插入图片描述](https://img-blog.csdnimg.cn/3b78783e70ef458bb7ffdaca68d0d74f.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6YOR5Li65Lit,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)

点击每一行的编辑按钮，可以对用户信息进行编辑。

![在这里插入图片描述](https://img-blog.csdnimg.cn/99b6db3fbc1e40ca99f7aad1d11214aa.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6YOR5Li65Lit,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


点击每一行的启用/禁用按钮，可以对用户信息进行启用/禁用。

![在这里插入图片描述](https://img-blog.csdnimg.cn/9eb4e9fa99944856a84614e7edfa3a3e.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6YOR5Li65Lit,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


点击每一行的删除按钮，可以对用户进行删除操作。

![在这里插入图片描述](https://img-blog.csdnimg.cn/d4472e96000944058b01c6f5d89f111c.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6YOR5Li65Lit,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


## 权限管理模块：
系统管理包括登入用户、角色权限、系统菜单、数据字典等功能，主要功能为对系统的登入账户的信息维护。管理员可以根据需要对各个部分进行编辑。系统的用户管理模块负责维护系统登入用户的删改，前端将操作的数据通过ajax发送到后端的控制器层，后逐层深入操作底层数据库，再将返回结果给视图层渲染。管理员可以在该模块中对用户进行日常的维护工作。对于登入用户管理功能，管理员可以对用户的信息进行编辑、删除、禁用等操作；对于角色权限管理，管理员可以根据用户，选择对该用户进行添加或是删除某项权限。

![在这里插入图片描述](https://img-blog.csdnimg.cn/acf8c172e215427bbd90fd6f95cb43bc.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6YOR5Li65Lit,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


管理员可以点击“添加角色”按钮，完成角色的添加。

![在这里插入图片描述](https://img-blog.csdnimg.cn/98fab654d34c4a7892fb8cbe38db883e.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6YOR5Li65Lit,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


管理员可以点击每一行的“菜单权限”按钮，完成对角色的菜单权限分配。

![在这里插入图片描述](https://img-blog.csdnimg.cn/6c0b1e2d2e5f4eb8bab580e11295703c.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6YOR5Li65Lit,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


管理员可以点击每一行的“数据权限”按钮，完成对角色数据权限的分配。

![在这里插入图片描述](https://img-blog.csdnimg.cn/8fcd368f3a5e4bed845178fee014f98f.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6YOR5Li65Lit,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


管理员可以点击每一行的“设置默认”按钮，将角色设置为默认角色，新用户自动会赋予该角色。

![在这里插入图片描述](https://img-blog.csdnimg.cn/5d99083468584c6cb76b7efee8fda652.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6YOR5Li65Lit,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


## 系统菜单模块：

系统菜单模块用于控制系统菜单的代码位置、图表、模块名称等信息，该模块功能面向开发者。

![在这里插入图片描述](https://img-blog.csdnimg.cn/b2678a9199eb4acc8edfee6443c5f118.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6YOR5Li65Lit,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


## 数据字典模块：

该模块用户存放下拉框的常用数据，完成快捷开发。

![在这里插入图片描述](https://img-blog.csdnimg.cn/c2c3639d1c3049479f9df58c7b7713fc.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6YOR5Li65Lit,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


管理员可以添加数据字典，需要和代码中的字段进行匹配。

![在这里插入图片描述](https://img-blog.csdnimg.cn/78f8cea8ea204d65aa95cc619d01076c.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6YOR5Li65Lit,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


管理员可以对数据字典下的数据值进行编辑操作。

![在这里插入图片描述](https://img-blog.csdnimg.cn/d89b10a5be9a4f3fb47b0fe012cbcc81.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6YOR5Li65Lit,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


## 参保人员模块：

参保人员档案包含了参保人员的信息，其中中间区域上部分含有添加、搜索、筛选功能按钮，下方显示参保人员的相关医保信息，下侧窗口为参保人员详细信息，点击参保人员，会将该参保人员的基础信息、社保情况、参保情况显示在该中间区域的下方，可对这些进行信息进行修改，包括基础信息的修改，社保情况的修改，参保情况的修改。

![在这里插入图片描述](https://img-blog.csdnimg.cn/7172ef11132945a7bbfbb536f0b0ad31.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6YOR5Li65Lit,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


点击“添加人员”，则可以录入大病患者的基础信息，包括姓名、手机号、身份证号码、社保卡号、家庭住址、以及保险类型。然后点击“提交”则可以进行参保人员信息了录入

![在这里插入图片描述](https://img-blog.csdnimg.cn/c3f5e43538b2469a96a15948d600e72d.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6YOR5Li65Lit,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


## 医保充值模块：

医保充值界面中，同样包含了参保人的一些基本信息，如姓名、电话、身份证、社保卡及余额等，管理人员可以点击右侧的充值按钮给参保人员进行充值。

![在这里插入图片描述](https://img-blog.csdnimg.cn/e3584e24f253429789898c8b1d000bac.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6YOR5Li65Lit,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


管理员可以点击每一行的充值按钮，完成医保卡的充值操作。
下面是模拟医保充值模块的实现，以上步骤已经讲需要参保人员信息录入了，但是医保卡里没有钱，无法进行看病报销。所以需要进行医保充值。选择需要充值的社保卡，点击后方“充值”按钮，弹出“医保充值”的框，输入充值价格就可以了。

![在这里插入图片描述](https://img-blog.csdnimg.cn/5fee788d1b1e45fbb59a27addaadc10a.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6YOR5Li65Lit,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


## 大病保险模块：

大病保险模块是对保险手术相关的信息修改，所以该部分功能包括了医疗保险信息的修改和手术档案信息的修改。包括了最基本的对医疗保险信息和手术档案的增删改查，首先点击左侧的医疗保险或者手术档案即可链接到相应的界面，然后对相应的信息进行修改，例如如图5-7所示，当前页面为医疗保险的信息，在这个页面可以对医疗保险的信息继续修改，点击添加按钮即可添加医疗保险，登记保险名称，分类门诊百分比等，这些医疗保险信息分别都与后续其他模块如大病登记或是保险审核相干，这些信息都会影响到其他模块。手术档案部分同医疗保险部分的功能大体上相同，也包含相应的添加、搜索、编辑等，这里的设置同样能够影响到后续其它模块，这里的主要功能是对手术级别以及手术费用的设置，这样便与医疗保险的等级对应起来。
其中，保险名称有三种，分别是最低医疗保险、高档医疗保险、基本医疗保险，ABC三类大病门诊百分比也不同。保险审核员可以对其进行编辑和删除。此模块是医保管理员进行操作的。

![在这里插入图片描述](https://img-blog.csdnimg.cn/55d155cdcb834fdb9b1da13fba38e90e.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6YOR5Li65Lit,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


此外还有手术档案小模块，包括手术名称，手术价格，功能主治的介绍，以及手术类型，例如关节穿刺术，手术价格为6750元，对人体关键骨节进行复位的穿刺，属于一级手术。

![在这里插入图片描述](https://img-blog.csdnimg.cn/1fc2983db5a9484fa00bce560a0b47fc.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6YOR5Li65Lit,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


## 看病登记模块：

大病登记模块包含了参保人员看病时的具体信息，该部分可帮助医疗相关工作者查看查找相关参保人员的就医信息，包括门诊的类型、费用总计以及看病的日期。如图5-9所示，当前页面为看病登记的信息，在这个页面可以对参保人员的就医信息进行查看，该模块也可对数据进行增删查功能，在查找部分，管理员可根据门诊的类型来选择患者查看患者。该模块可点击查看按钮即可进行更加详细的查看，例如手术类型，诊断费用，费用抵扣等。

![在这里插入图片描述](https://img-blog.csdnimg.cn/ea8bc353ea3c4e27bed1180ec43b0a93.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6YOR5Li65Lit,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


点击“添加”的按钮，可以为患者添加就医信息，弹出界面，如下图所示，选择“患者”、 “手术”以及“门诊类型”和“诊断原价”来进行添加。剩下的信息会自动带出，自动结算报销后的价格。

![在这里插入图片描述](https://img-blog.csdnimg.cn/b0d82e5ee6864af3b35e76c47fc034aa.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6YOR5Li65Lit,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


点击选择“选择患者”，弹出如下界面，该界面包含了参保人员的信息，包括姓名，联系电话，身份证号以及相关社保等信息，双击完成选择。

![在这里插入图片描述](https://img-blog.csdnimg.cn/22440d4450f4424c8a43f29675c5344c.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6YOR5Li65Lit,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


点击“选择手术”，可以选择需要导入档案的手术信息，点击手术并输入数量，选择“暂存”，“从手术档案导入”，即可添加手术。

![在这里插入图片描述](https://img-blog.csdnimg.cn/43fc2f12bdb94f5daf39bf79aae01e79.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6YOR5Li65Lit,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


门诊类型根据设置来对不同的门诊类型进行选择，对应不同的自付比例，如下图所示。

![在这里插入图片描述](https://img-blog.csdnimg.cn/99c6c57285fe4b9fa9bf0e25ac693b9d.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6YOR5Li65Lit,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


输入“诊断原价”，例如输入“6000”，系统根据所选择的门诊类型的不同，计算不同的报销比，自动计算报销后的费用总计“1200”，最后点击“提交与保存”即可完成看病的档案登记。

![在这里插入图片描述](https://img-blog.csdnimg.cn/ec6e8faf1aa44d9a91638e01735a2981.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6YOR5Li65Lit,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


## 保险审核模块：

保险审核模块是相关工作人员对参保人员提出的大病保险相关的审核，所以该部分的功能主要是对参保人的保险审核。该部分同样包括了对参保人员的基础查找功能，该部分的最主要的功能是为了方便保险管理人员对参保人提出的保险抵扣进行审核，所以该部分为了便于相关保险工作者进行高效审核，在查找部分的时候，可以直接查找审核状态，提高审核的工作效率。在审核参保人员的信息准去无误后，相关保险工作者可以直接点击审核通过或选择不通过，并同时批注上不通过的理由。

![在这里插入图片描述](https://img-blog.csdnimg.cn/91e4d06c35fa44a4affb4b3063dcdbde.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6YOR5Li65Lit,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


如果保险审核员对于申请的医保报销无法进行通过，则可以点击“退回”，输入退回的原因：该病不予报销，点击“确定”，则可以退回申请。

![在这里插入图片描述](https://img-blog.csdnimg.cn/9fff0e54af8844c996bec82bc07793ec.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6YOR5Li65Lit,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


如果某个医保保险申请符合要求，则可以审核通过，点击“审核通过”按钮，再点击“确认”即可。

![在这里插入图片描述](https://img-blog.csdnimg.cn/16e0ab4436cc4712be35bd414df0705c.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6YOR5Li65Lit,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


## 安装说明

1. 前往[Redis官网](https://redis.io/download)，下载Redis文件，zip压缩包即可。

2. 参考[Redis教程](https://www.runoob.com/redis/redis-install.html)，运行Redis。即使用cmd，进入到redis解压目录，输入redis-server.exe redis.windows.conf即可。出现下图所示界面则为运行成功。

![在这里插入图片描述](https://img-blog.csdnimg.cn/f554229c3bb84b75ac063bb8c83a9924.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6YOR5Li65Lit,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


3. 使用VsCode打开前端项目目录，新建终端，输入npm i安装依赖，后输入npm run dev运行项目。

![在这里插入图片描述](https://img-blog.csdnimg.cn/a0db249b9c5e4c24880752081eba95de.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6YOR5Li65Lit,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/b8b4b4770f6e45b48fec4884d539933f.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6YOR5Li65Lit,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


4. 使用Idea打开后端项目目录，检查Maven配置和JDK配置是否正常。

![在这里插入图片描述](https://img-blog.csdnimg.cn/a971238abbbb44dc807ce8e79096e452.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6YOR5Li65Lit,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


5. 检查后端数据库配置是否符合开发环境要求。

![在这里插入图片描述](https://img-blog.csdnimg.cn/816f8ff247574c1fa02a26786c1a8acf.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6YOR5Li65Lit,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


6. 启动后端项目。

![在这里插入图片描述](https://img-blog.csdnimg.cn/452e406daddf43ee85030ecf900c5a91.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6YOR5Li65Lit,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


7. 打开浏览器，输入项目前端地址。

```
http://localhost:60002/
```

## 说明

1. 本项目开源，遵循GPL-3.0开源协议，二次开发请注明原项目的来源，不允许直接转售。
2. 作者拥有本软件构建后的应用系统全部内容所有权及独立的知识产权。
3. 如有问题，欢迎在仓库评论区留言，看到后会第一时间回复。相关意见会酌情考虑，但没有一定被采纳的承诺或保证。

## 免责声明

下载本系统代码的用户，必须同意以下内容，否则请勿下载！

1. 出于自愿而使用/开发本软件，了解使用本软件的风险，且同意自己承担使用本软件的风险。
2. 利用本软件构建的网站的任何信息内容以及导致的任何版权纠纷和法律争议及后果和作者无关，作者对此不承担任何责任。
3. 在任何情况下，对于因使用或无法使用本软件而导致的任何难以合理预估的损失（包括但不仅限于商业利润损失、业务中断与业务信息丢失），作者概不承担任何责任。
到后会第一时间回复。相关意见会酌情考虑，但没有一定被采纳的承诺或保证。

## 免责声明

下载本系统代码的用户，必须同意以下内容，否则请勿下载！

1. 出于自愿而使用/开发本软件，了解使用本软件的风险，且同意自己承担使用本软件的风险。
2. 利用本软件构建的网站的任何信息内容以及导致的任何版权纠纷和法律争议及后果和作者无关，作者对此不承担任何责任。
3. 在任何情况下，对于因使用或无法使用本软件而导致的任何难以合理预估的损失（包括但不仅限于商业利润损失、业务中断与业务信息丢失），作者概不承担任何责任。
4. 必须了解使用本软件的风险，作者不承诺提供一对一的技术支持、使用担保，也不承担任何因本软件而产生的难以预料的问题的相关责任。
