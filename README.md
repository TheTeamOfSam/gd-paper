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
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1）在WebStorm中打开前端的应用； <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2）在WebStorm中配置前端应用所需要的NodeJS环境； <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3）配置好NodeJS的环境之后设置启动的端口port； <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4）在项目中的iphost.js文件中修改服务端的IP和端口（如果有申请域名则可直接填写域名）； <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5）启动完毕，点击WebStorm中的应用启动按钮即可将项目跑起来； <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6）另一种方法是可以直接使用node的服务启动命令npm来启动应用； <br>

### 3.2 服务端部署
#### 3.2.1 治理服务
