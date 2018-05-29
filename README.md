# <center>毕业设计——基于Java Web的在线音乐网站</center>

## 一 项目地址

<table>
	<thread>
		<tr>
			<th>归属</th>
			<th>服务描述</th>
			<th>服务地址</th>
		</tr>
	</thread>
	<tbody>
		<tr>
			<td>
				前端
			</td>
			<td>
				前端音乐服务，负责前端展示和用户交互的服务
			</td>
			<td>
				<a href="https://github.com/TheTeamOfSam/gd-music-frontend.git">https://github.com/TheTeamOfSam/gd-music-frontend.git</a>
			</td>
		</tr>
		<tr>
			<td rowspan="3">
				服务端
			</td>
			<td>
				负责服务端服务治理
			</td>
			<td>
				<a href="https://github.com/TheTeamOfSam/gd-eureka-server.git">https://github.com/TheTeamOfSam/gd-eureka-server.git</a>
			</td>
		</tr>
		<tr>
			<td>
				负责在注册和重置密码这两种情景下的邮件发送验证
			</td>
			<td>
				<a href="https://github.com/TheTeamOfSam/gd-email-server.git">https://github.com/TheTeamOfSam/gd-email-server.git</a>
			</td>
		</tr>
		<tr>
			<td>
				负责与前端对接的音乐服务端主服务，包括用户模块等模块的各个功能
			</td>
			<td>
				<a href="https://github.com/TheTeamOfSam/gd-music-server.git">https://github.com/TheTeamOfSam/gd-music-server.git</a>
			</td>
		</tr>
	</tbody>
</table>

## 二 项目部署需要的IDE和环境

|归属|IDE|
|---|---|
|前端|WebStorm/VSCode|
|服务端|IntelliJ IDEA/Eclipse|
|数据库|MySQL、MySQL Workbench/Navicat Premium|
|其他软件|需要安装并配置NodeJS、Redis、Nginx、Maven、JDK等服务所需环境|

## 三 项目部署说明
### 3.1 前端部署
&nbsp;&nbsp;1）在WebStorm中打开前端的应用； <br>
&nbsp;&nbsp;2）在WebStorm中配置前端应用所需要的NodeJS环境； <br>
&nbsp;&nbsp;3）配置好NodeJS环境之后设置启动的`端口port`； <br>
&nbsp;&nbsp;4）在项目中的`iphost.js`文件中修改服务端的`IP和端口（如果有申请域名则可直接填写域名）`； <br>
&nbsp;&nbsp;5）启动完毕，点击WebStorm中的应用启动按钮即可将项目跑起来； <br>
&nbsp;&nbsp;6）另一种方法是可以直接使用`node的服务启动命令npm`来启动应用； <br>

### 3.2 服务端部署

&nbsp;&nbsp;
 <span style="color: red">注意，将`gd-eureka-server`、`gd-email-server`、`gd-music-server`放在同一个目录下，并用IDEA打开这同一个目录，操作过程中需要等待下载完所需的jar包。</span> 

#### 3.2.1 治理服务
&nbsp;&nbsp;1）在IDEA中导入`gd-eureka-server`服务的module； <br>
&nbsp;&nbsp;2）点击IDEA的启动按钮即可将服务启动； <br>
#### 3.2.2 邮件发送验证服务
&nbsp;&nbsp;1）在IDEA中导入`gd-email-server`服务的module；<br>
&nbsp;&nbsp;2）在`gd-email-server`中的`application.properties`文件中的`from.email.address`后配置`发送邮件的邮箱账号`，`from.email.password`后配置`发送邮件的邮箱密码或者是授权码`，`smtp.qq.com`后配置`发送邮箱所使用的协议`；<br>
&nbsp;&nbsp;3）在`gd-email-server`中的`application.properties`文件中的`spring.datasource.password`后配置数据库密码；<br>
&nbsp;&nbsp;4）完成后直接点击IDEA上的服务启动按钮即可将邮件服务启动起来；<br>

#### 3.2.3 音乐主服务
&nbsp;&nbsp;1）在IDEA中导入`gd-music-server`服务的module；<br>
&nbsp;&nbsp;2）在`gd-music-server`中的`application.properties`文件中的`spring.datasource.password`后配置数据库密码，并配置`Redis`的用户和密码等配置；<br>
&nbsp;&nbsp;3）在`gd-email-server`中的`application.properties`文件中的`url.link`后配置Nginx服务所在的`IP和端口（如果有域名直接将IP和端口改成域名即可）`；<br>
&nbsp;&nbsp;4）在IDEA下直接点击服务启动按钮即可将音乐服务启动起来；<br>

#### 3.2.4 数据库部署
&nbsp;&nbsp;可以按照论文中`数据库设计与系统实现`这一章节的中的数据库设计的一部分进行数据库配置。
 <span style="color: red">需要注意的是最好将邮件服务数据库重新命名成`gd_email_server `，将音乐服务命名成`gd_music_server `</span>