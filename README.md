# [MQ-Q](https://github.com/OS-Q/MQ-Q) 

[![sites](OS-Q/OS-Q.png)](http://www.os-q.com)

#### 系统硬件：[Edge](https://github.com/OS-Q/Edge-Q)
#### 系统服务：[QaaS](https://github.com/OS-Q/QaaS)
#### 系统交互：[UI-Q](https://github.com/OS-Q/UI-Q)
#### 系统存储：[DB-Q](https://github.com/OS-Q/DB-Q)
#### 系统通信：[MQ-Q](https://github.com/OS-Q/MQ-Q)

## [MQ-Q简介](https://github.com/OS-Q/DB-Q/wiki)

MQ-Q是Q系统通信组成部分，通过消息队列的方式实现各个节点间的低耦合高并发通信连接

### MQ(Message Queue)

MQ消息总线，是一种跨进程的通信机制，用于上下游传递消息。

在互联网架构中，MQ是一种非常常见的上下游“逻辑解耦+物理解耦”的消息通信服务。

使用了MQ之后，消息发送上游只需要依赖MQ，逻辑上和物理上都不用依赖其他服务。

#### MQ优点

* 处理高并发情况，变成异步处理

* 松耦合，对MQ的调用不依赖于任何其它应用，没有任何依赖或者时序要求。

* 在任何应用程序中以接近零的消耗，不需要任何其他依赖就可以链接的库，能运行在任何操作系统上，并能用任何编程语言开展。

#### MQ缺点

* 消息传递路径更长，消息时延增加

* 上位设备无法知道下位设备的执行结果

* 不丢不重难以同时保证消息，可靠性和重复性互为矛盾


#### 关于系统架构：[OS-Q](https://github.com/OS-Q/OS-Q)

---

# [Q1](https://github.com/OS-Q/Q1) 

对于Q1控制设备而言，只作为生产和消费者，不需要提供Broker服务

---

# [Q2](https://github.com/OS-Q/Q2) 

### [ZeroMQ](https://github.com/zeromq) 

ZeroMQ号称是“史上最快的消息队列”，基于c语言开发的，实时流处理sorm的task之间的通信就是用的zeroMQ。选定为边缘端平台组件

ZMQ(ZeroMQ简称)是一个简单好用的传输层，像框架一样的一个socket library，他使得Socket编程更加简单、简洁和性能更高。是一个消息处理队列库，可在多个线程、内核和主机盒之间弹性伸缩。

特点： 高到离谱的吞吐量、可自行开发持久化、支持数据量较小的持久化、不过只是保存到内存中。 
除了点对点 即：请求-应答模式 是一对一 、不可有消息丢失 、其他都没有对消息丢失做强烈的保证、 
官方给出的观点：我们希望消息的尽快送达、而不介意消息的丢失

zeromq的目标是成为网络协议栈的一部分、进而进军linux 内核 、所以与Rabbit Active 有着本质以及目标的区别。

---

# [Q3](https://github.com/OS-Q/Q3) 

### [RabbitMQ](https://github.com/rabbitmq) 

 RabbitMQ是一个在AMQP基础上完成的，可复用的企业消息系统，用erlang语言开发，遵循Mozilla Public License开源协议。选定为云端平台组件

#### 概念说明：

- Broker：简单来说就是消息队列服务器实体。
- Exchange：消息交换机，它指定消息按什么规则，路由到哪个队列。
- Queue：消息队列载体，每个消息都会被投入到一个或多个队列。
- Binding：绑定，它的作用就是把exchange和queue按照路由规则绑定起来。
- Routing Key：路由关键字，exchange根据这个关键字进行消息投递。
- vhost：虚拟主机，一个broker里可以开设多个vhost，用作不同用户的权限分离。
- producer：消息生产者，就是投递消息的程序。
- consumer：消息消费者，就是接受消息的程序。
- channel：消息通道，在客户端的每个连接里，可建立多个channel，每个channel代表一个会话任务。

---

# [Q4](https://github.com/OS-Q/Q4) 

### [Kafka](hhttps://github.com/apache/kafka) 

由Apache软件基金会开发的一个开源流处理平台，由Scala和Java编写。Kafka是一种高吞吐量的分布式发布订阅消息系统，它可以处理消费者规模的网站中的所有动作流数据。 

kafka的设计初衷是希望作为一个统一的信息收集平台,能够实时的收集反馈信息,并需要能够支撑较大的数据量,且具备良好的容错能力.

---

###  qitas@qitas.cn
####  [Q redefined the scope of Operation System](http://www.OS-Q.com)
