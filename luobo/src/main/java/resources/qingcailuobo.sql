




CREATE TABLE `blog` (
  `id` char(32) NOT NULL COMMENT '主键，UUID作为键值',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `author` varchar(50) NOT NULL COMMENT '作者',
  `summary` text NOT NULL COMMENT '摘要',
  `content` text NOT NULL COMMENT 'markdown格式的内容，用于重新编辑',
  `commentNum` int(11) NOT NULL DEFAULT '0' COMMENT '评论数',
  `heartNum` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `readNum` int(11) NOT NULL DEFAULT '0' COMMENT '阅读数',
  `publishTime` datetime NOT NULL COMMENT '文章创建时间',
  `url` varchar(100) NOT NULL COMMENT '文章相对URL',
  `signature` char(32) NOT NULL COMMENT '文章哈希签名，防止出现重复文章',
  `categoryID` char(32) NOT NULL COMMENT '文章类别ID',
  `lastUpdateTime` datetime NOT NULL COMMENT '文章上次修改时间',
  `path` varchar(100) NOT NULL COMMENT '静态化的文件磁盘路径',
  `coverURL` varchar(255) DEFAULT NULL COMMENT '封面图片',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '博文类型，0表示普通博文，1表示富博文(带封面图片)',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '博文状态，0显示，1不显示，2草稿',
  `statusName` varchar(20) DEFAULT NULL COMMENT '状态名称：显示，不显示，草稿',
  `html` text NOT NULL COMMENT 'html格式的博文，主要用于重新静态化',
  `tags` varchar(256) DEFAULT NULL COMMENT '博文标签',
  `shareNum` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `blog` WRITE;

INSERT INTO `blog` (`id`, `title`, `author`, `summary`, `content`, `commentNum`, `heartNum`, `readNum`, `publishTime`, `url`, `signature`, `categoryID`, `lastUpdateTime`, `path`, `coverURL`, `type`, `status`, `statusName`, `html`, `tags`, `shareNum`)
VALUES
	('00e05640cb9a4cef9ec0c355b4c4cd8c','第三届阿里中间件性能挑战赛 初赛总结','胡建洪','初赛题目是《基于Open-Messaging实现进程内消息引擎》，对应的赛题描述：支撑阿里双十一的万亿级消息中间件RocketMQ在2016年10月正式进入Apache基金会进行孵化。异步解耦，削峰填谷，让消息中间件在现代软件架构中拥有着举足轻重的地位。天下大势，分久必合，合久必分，软件领域也是如此。市场上消息中间件种类繁多，阿里消息团队在此当口，推出厂商无关的Open-Messaging规范，促进消息领域的进一步发展。本赛题要求参赛选手阅读Open-Messaging规范，了解Message，Topic，Queue，Producer，Consumer等概念，并基于相关语言的接口实现进程内消息引擎。','新华社天津9月24日电（记者翟永冠　韩筱婧）随着近年来无人机技术和产业迅猛发展，“黑飞”现象普遍存在，对民航飞行安全等造成安全隐患。23日，由天津市宝坻区政府和中科院地理科学与资源研究所联合打造的京津翱翔基地正式揭牌，配备科学试验空域的基地，为无人机应用和管控科学研究提供专用规范化的场地。\n中国科学院副秘书长邓勇介绍，该试验基地由研究所、地方政府、企业三方共建，场地拥有相关管理部门专门批准的科学试验空域。作为中国科学院无人机应用与管控研究中心的试验基地之一，京津翱翔基地为中科院完成国家科研任务研发和测试提供技术和平台支持，已经列入科学试验计划的研究有无人机组网观测、电子地理围栏管控系统、低空航路构建关键技术、雷达载荷平台一体化，复合旋变翼、平台载荷轻量化标准化技术等试验。',1,140,89,'2017-07-21 17:51:58','http://localhost:8080/luobo/front/B20170924195941.html','93C299989787E9190F93DF9CB49A45B2','aab2e1cb0e4148c4b081df9940c2800a','2017-07-21 17:51:58','/Users/jianhonghu/Public/develop/java/luobo/src/main/webapp/front/B20170924195941.html','http://localhost:8080/luobo/front/static/img/01.jpg',1,0,'发表','<h1 id=\"h1-1-\"><a name=\"1.    初赛\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>1.    初赛</h1><p>初赛题目：《基于Open-Messaging实现进程内消息引擎》</p>\n<h2 id=\"h2-1-1-\"><a name=\"1.1.    赛题背景分析及理解\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>1.1.    赛题背景分析及理解</h2><p>赛题描述：支撑阿里双十一的万亿级消息中间件RocketMQ在2016年10月正式进入Apache基金会进行孵化。异步解耦，削峰填谷，让消息中间件在现代软件架构中拥有着举足轻重的地位。天下大势，分久必合，合久必分，软件领域也是如此。市场上消息中间件种类繁多，阿里消息团队在此当口，推出厂商无关的Open-Messaging规范，促进消息领域的进一步发展。本赛题要求参赛选手阅读Open-Messaging规范，了解Message，Topic，Queue，Producer，Consumer等概念，并基于相关语言的接口实现进程内消息引擎。<br>分析与理解：消息中间件分布式系统的消息传递和通信中具有举足轻重的作用，消息中间件的性能在一定程度上决定了整个系统的性能。消息中间件对于生产者而言，写入消息要快，且消息写入后不能丢失；对于消费者而言，消费顺序不能乱，消息到的消息要准确及时。一般而言，要做到高性能的分布式消息中间件，在架构上和实现上都要高屋建瓴，推出通用的规范和概念，便于沟通和交流，以及软件的发展和升级。目前，阿里具有很大的平台，拥有别人没有的数据和技术优势，但是也面临着别人没有的挑战，比如双十一亿万级消息挑战等。通过这次比赛，我们可以更进一步感受和了解阿里的技术以及面临的挑战，通过拓宽自己的眼界，提升自己的技术水平。\n<h2 id=\"h2-1-2-\"><a name=\"1.2.    核心思路\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>1.2.    核心思路</h2><p>根据题目要求，我们需要实现指定接口，完成消息的生产、存储、消费等功能。其中消息的存储是关键，需要保证消息的正确性和顺序一致性，同时需要持久化到磁盘上，消息持久化的方式和性能影响着生产消息和消费消息的速度。下面是我们的核心思路的具体说明。</p>\n<h3 id=\"h3-1-2-1-\"><a name=\"1.2.1.    整体处理流程\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>1.2.1.    整体处理流程</h3><p>整体处理流程如图1所示，首先启动生产进程生产消息，并进行消息存储，由于消息生产和消息消费是不同进程，需要进行消息持久化，保存到磁盘上，待消息生产结束后，结束生产进程，启动消费进程进行消息消费，消费过程需要保证消费到的消息次序和生产时次序一致，且消息正确。</p>\n<p><img src=\"http://static.huding.name/image/c3b6eb140aa8480fa2f2bfeadb67d336.png\" alt=\"图1 整体流程图\">\n<h3 id=\"h3-1-2-2-\"><a name=\"1.2.2.    消息存储方案\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>1.2.2.    消息存储方案</h3><p>在比赛中，我们实现了多种消息存储方案，分别如下：<br>方案1：这个消息存储方案为一个Topic或者Queue对应一个文件。每个生产者在写入消息到Topic或者Queue时，先获取Topic或者Queue的互斥锁，获取到锁后，然后再写入消息。每个消费者消费时可以同时打开同一个文件进行消费，互不干扰。<br>优点：管理简单<br>缺点：需要加锁以保证消息的正确写入，效率不高；<br>方案2：这个消息存储方案为一个Topic或者Queue对应多个文件。对于一个Topic或者Queue我们以Topic或Queue的名称建立一个目录，每个线程如果要将消息写入到该Topic或者Queue中，则在目录下创建一个独立文件，该线程的要写入该Topic或者Queue的后续消息都将写入到该文件中。当需要消费一个Topic或者Queue中的消息时，消费者只需依次消费该Toipc或者Queue下对应的目录下的所有文件的消息即可。<br>优点：无需加锁，写入效率较高。<br>缺点：消息存储时文件数跟线程相关，耦合度相对较高。\n<p>对比方案1和方案2，我们最后采用方案2实现消息存储，线上测试时效率也比方案1要高。</p>\n<h3 id=\"h3-1-2-3-\"><a name=\"1.2.3.    消息持久化\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>1.2.3.    消息持久化</h3><p>消息由头部（headers)、属性（properties)、主体（body)三个部分组成，其中头部和属性为KeyValue结构，消息主体为byte[]数组。</p>\n<p>消息存储需要序列化，消息是一个对象，对象的序列化方案主要有JDK的Serializable ，将对象转换为JSON或者XML格式的字符串，自定义存储格式等。其中JDK的Serializable 在序列化时，需要额外写入对象的Class信息，效率不高，且浪费空间。JSON或者XML则需要将对象转换为字符串，多了一个转换过程，增加了CPU开销。我们根据实际情况，采用自定义存储格式进行消息序列化，具体如下：<br>对于KeyValue结构的Headers或Properties，我们先写入KeyValue总数，然后对于每个KeyValue，先写入Key的字节数组长度，然后写入key的字节数组，再写入Value的字节数组长度，最后写入Value的字节数组。<br>对于消息主体的byte[]，我们先写入byte[]的长度，然后写入byte[]。\n<p>其中，一条消息序列化后的结构为：Header  + Properties +  body，示意图如图2所示：<br><img src=\"http://static.huding.name/image/dce8cb228179413289fd08d0faad8784.png\" alt=\"图2 消息序列化结构图\">\n<h3 id=\"h3-1-2-4-\"><a name=\"1.2.4.    数据压缩方案\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>1.2.4.    数据压缩方案</h3><p>由于消息数据量大，而IO速度比较慢，因此我们将数据进行压缩后，在进行IO操作，这样做可以减少IO的数据量而提高写入效率。当然这种方案是用CPU开销换IO开销的方案。<br>对于数据压缩，无损压缩算法主要有Deflater，Snappy，LZ4，QuickLZ等。其中Deflater压缩速度比较慢。在线上测试时，我们使用了Deflater，Snappy，QucikLZ等3个压缩算法，压缩性能依次为：<br>Snappy &gt; QiuckLZ &gt; Deflater<br>在数据压缩时，如果每次只压缩一条消息，无疑效率是低下的，因此我们设置消息序列化缓存区，缓存区大小为32KB + 256B，每当缓存区满了，则调用压缩算法将缓存区数据压缩并写入文件。\n<h3 id=\"h3-1-3-\"><a name=\"1.3.    关键代码\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>1.3.    关键代码</h3><p>消息写入关键代码：</p>\n<pre><code>    public class SnappyWriter implements IWriter {\n        private RandomAccessFile file;\n        public static final int DEFAULT_SIZE = IConstants.CMP_MS;\n        private byte[] bytes = new byte[DEFAULT_SIZE + IConstants.MSG_ML];\n        private int p;\n        private byte[] cmp = new byte[DEFAULT_SIZE + IConstants.MSG_ML];\n\n        public SnappyWriter(String dir) throws IOException {\n            file = new RandomAccessFile(dir, \"rw\");\n        }\n        private void put(byte a) {\n            bytes[p++] = (byte) (a &amp; 0xff);\n        }\n        private void put(byte[] bs) {\n            int a = bs.length;\n            if(a &lt; Byte.MAX_VALUE){\n                bytes[p++] = (byte) (a &amp; 0xff);\n            } else {\n                bytes[p++] = (byte) ((a &gt;&gt; 8 &amp; 0xff) | 0x80);\n                bytes[p++] = (byte) (a &amp; 0xff);\n            }\n            System.arraycopy(bs, 0, bytes, p, bs.length);\n            p += bs.length;\n        }\n        public void write(DefaultBytesMessage message) throws IOException {\n            DefaultKeyValue h = (DefaultKeyValue)message.headers();\n            DefaultKeyValue pro = (DefaultKeyValue)message.properties();\n            // 减少一个字节存储头部和属性的长度\n            byte tsize = (byte) ((((byte)h.num) &lt;&lt; 4 &amp; 0xf0) | (pro.num &amp; 0x0f));\n            put(tsize);\n            for (int i = 0; i &lt; h.num; i++) {\n                put(h.keys[i].getBytes());\n                put(h.values[i]);\n            }\n            for (int i = 0; i &lt; pro.num; i++) {\n                put(pro.keys[i].getBytes());\n                put(pro.values[i]);\n            }\n            byte[] body = ((DefaultBytesMessage) message).getBody();\n            put(body);\n\n            if (p &gt;= DEFAULT_SIZE) {\n                int clen = Snappy.compress(bytes, 0,p, cmp, 0);\n                file.writeShort(clen);\n                file.write(cmp, 0, clen);\n                this.p = 0;\n            }\n        }\n        public void close() throws IOException {\n            if (this.p &gt; 0) {\n                int clen = Snappy.compress(bytes, 0,p, cmp, 0);\n                file.writeShort(clen);\n                file.write(cmp, 0, clen);\n            }\n            file.writeShort(0);\n            file.close();\n        }\n    }\n</code></pre><p>消息读取关键代码：</p>\n<pre><code>    public class SnappyReader implements IReader {\n        private int cnt = 0;\n        private MappedByteBuffer[] mBuffers;\n\n        public SnappyReader(String dir) throws IOException {\n            File dirFile = new File(dir);\n            if (!dirFile.exists()) {\n                this.complete = true;\n                return;\n            }\n            File[] files = dirFile.listFiles();\n            if (files.length &lt;= 0) {\n                this.complete = true;\n                return;\n            }\n            mBuffers = new MappedByteBuffer[files.length];\n            for (int i = 0; i &lt; files.length; i++) {\n                @SuppressWarnings(\"resource\")\n                FileChannel channel = new FileInputStream(files[i])\n                        .getChannel();\n                mBuffers[i] = channel.map(MapMode.READ_ONLY, 0, channel.size());\n            }\n            mBuffer = mBuffers[cnt++];\n        }\n\n        public BytesMessage read() throws Exception {\n            if (complete) {\n                return null;\n            }\n            if(p &lt; limit){\n                return fromBuffer();\n            }\n            int len = 0;\n            while ((len = getLen()) == 0) {\n                if (cnt == mBuffers.length) {\n                    this.complete = true;\n                    return null;\n                }\n                mBuffer = mBuffers[cnt++];\n            }\n            mBuffer.get(cmp, 0, len);\n            limit = Snappy.uncompress(cmp, 0, len, bytes, 0);\n            p = 0;\n            return fromBuffer();\n        }\n        private int getLen(){\n            byte b1 = mBuffer.get();\n            byte b2 = mBuffer.get();\n            return ((((b1 &amp; 0xff) &lt;&lt; 8) | (b2 &amp; 0xff))) &amp; 0x7fffffff;\n        }\n\n        private byte[] cmp = new byte[IConstants.CMP_MS + IConstants.MSG_ML];\n        private byte[] bytes = new byte[IConstants.CMP_MS + IConstants.MSG_ML];\n        private int p;\n        private int limit;\n\n        private ByteBuffer mBuffer;\n        private boolean complete = false;\n\n        private QingBytesMessage msg = new QingBytesMessage();\n        private QingKeyValue hds = new QingKeyValue(2);\n        private QingKeyValue pros = new QingKeyValue(4);\n\n        private static final String TOPIC = MessageHeader.TOPIC;\n        private static final String QUEUE = MessageHeader.QUEUE;\n\n        private BytesMessage fromBuffer() {\n            byte tsize = getByte();\n            int keySize = (tsize &gt;&gt; 4 &amp; 0x0f);\n            int pSize = (tsize &amp; 0x0f);\n            hds.clear();\n            for (int i = 0; i &lt; keySize; i++) {\n                String key = getString();\n                switch (key) {\n                case \"T\":\n                    hds.put(TOPIC, getBytes());\n                    break;\n                case \"Q\":\n                    hds.put(QUEUE, getBytes());\n                    break;\n                default:\n                    hds.put(key, getBytes());\n                    break;\n                }\n            }\n            msg.setHeaders(hds);\n            if(pSize &gt; 0){\n                pros.clear();\n                for (int i = 0; i &lt; pSize; i++) {\n                    pros.put(getString(), getBytes());\n                }\n                msg.setProperties(pros);\n            } else {\n                msg.setProperties(null);\n            }\n            msg.setBody(getBytes());\n            return msg;\n        }\n        public int getShort() {\n            return (((bytes[p++] &amp; 0xff) &lt;&lt; 8) | ((bytes[p++] &amp; 0xff)));\n        }\n\n        public byte getByte() {\n            return (byte) (bytes[p++] &amp; 0xff);\n        }\n        public String getString() {\n            int a = (bytes[p++] &amp; 0xff);\n            String s = new String(bytes, p, a);\n            p += a;\n            return s;\n        }\n        public byte[] getBytes() {\n            int a = (((bytes[p++] &amp; 0xff) &lt;&lt; 8) | ((bytes[p++] &amp; 0xff)));\n            byte[] b = new byte[a];\n            System.arraycopy(bytes, p, b, 0, a);\n            p += a;\n            return b;\n        }\n    }\n</code></pre><p>1.4.    总结<br>尽量实现对象复用，避免频繁创建对象，避免频繁GC。<br>能够避免加锁就避免，如果无法避免，则将加锁范围控制在最小范围内。<br>减少中间数据拷贝过程，尽量直接将数据拷贝志最终目标处，能极大的提高效率。<br>代码越优化越简单，往往简单的代码比复杂的代码可读性高，性能也相对来说比较高。\n<p>代码已经开源在GitHub上了，需要的同学可以参考下：<a href=\"https://github.com/hujianhong/open-messaging-contest.git\" title=\"初赛代码\">初赛代码</a></p>\n','Java,比赛',0),
	('093dcae887cd4904b2d244fcdca5473a','关于青菜萝卜博客在本地运行的方法','胡建洪','青菜萝卜在本地开发环境运行的方法，如果不需要Nginx的同学，只需先导入数据库脚本，然后直接将项目导入Eclipse或者MyEclipse中，修改数据库配置和Html静态化根目录，就可直接运行项目进行访问测试了。接下来先介绍下数据库脚本的导入。','新华社天津9月24日电（记者翟永冠　韩筱婧）随着近年来无人机技术和产业迅猛发展，“黑飞”现象普遍存在，对民航飞行安全等造成安全隐患。23日，由天津市宝坻区政府和中科院地理科学与资源研究所联合打造的京津翱翔基地正式揭牌，配备科学试验空域的基地，为无人机应用和管控科学研究提供专用规范化的场地。\n中国科学院副秘书长邓勇介绍，该试验基地由研究所、地方政府、企业三方共建，场地拥有相关管理部门专门批准的科学试验空域。作为中国科学院无人机应用与管控研究中心的试验基地之一，京津翱翔基地为中科院完成国家科研任务研发和测试提供技术和平台支持，已经列入科学试验计划的研究有无人机组网观测、电子地理围栏管控系统、低空航路构建关键技术、雷达载荷平台一体化，复合旋变翼、平台载荷轻量化标准化技术等试验。',6,145,1252,'2017-02-21 20:43:19','http://localhost:8080/luobo/front/B20170924195942.html','6EC6DF51013153030E327FF8D6D66C0D','18f3adde58d0497393f35e653b95aff8','2017-02-21 20:43:19','/Users/jianhonghu/Public/develop/java/luobo/src/main/webapp/front/B20170924195942.html',NULL,0,0,'发表','<p>青菜萝卜在本地开发环境运行的方法，如果不需要Nginx的同学，只需先导入数据库脚本，然后直接将项目导入Eclipse或者MyEclipse中，修改数据库配置和Html静态化根目录，就可直接运行项目进行访问测试了。接下来先介绍下数据库脚本的导入。</p>\n<h2 id=\"h2-u5BFCu5165u6570u636Eu5E93u811Au672C\"><a name=\"导入数据库脚本\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>导入数据库脚本</h2><p>在GitHub克隆或者直接下载下来的文件夹的根目录中qingcailuobo.sql就是MySQL数据库脚本。PS：注意下自己的MySQL服务器是否支持utf8编码，如果不支持的话，直接用文本编辑器打开数据库脚本将所有的utf8替换称utf8即可。</p>\n<p>将数据库脚本导入有命令行和数据库可视化工具，这里只介绍命令行的导入方式，依次执行如下命令：</p>\n<pre><code>create database qingcailuobo;\nuse qingcailuobo;\nsource XXXXX/qingcailuobo.sql;\n</code></pre><p>其中，XXXXX表示数据库脚本的存放的父目录。如果控制台输出包含“query ok”等字符表示倒入数据库成功成功，可以进入下一步了，否则就要根据控制台提示进行检查了。</p>\n<h2 id=\"h2-u5BFCu5165u9879u76EE\"><a name=\"导入项目\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>导入项目</h2><p>我开发博客系统时使用的是HBuilder+Eclipse，其中Hbuilder负责开发前端，即qingcai-front和qingcai-back两个文件夹，Eclipse负责开发后端，即luobo文件夹。其实只需要Eclipse就可以搞定项目在本地开发环境运行了，因此这里只介绍使用Eclipse导入和运行项目，我的开发方式对于没有接触过Nginx的同学来来说，可能看起来比较麻烦，所以这部分在下一篇博文介绍。</p>\n<p>打开Eclipse按照普通Java项目的方式导入项目（如果不会请自行百度），然后将qingcai-front和qingcai-back复制到luobo这个项目的WebRoot下面即可，然后打开luobo项目的src<br>目录下的config.properties,修改数据库配置和Html静态化根目录，其中静态化目录设置为qing-front，比如：\n<pre><code>STATICS_ROOT_PATH = /Users/jianhonghu/gitRepository/GitHub/blog/qingcai-front\n</code></pre><p>PS:由于这种方式和我本地开发方式不一样，需要同学在做如下修改，才能保证项目不出错，具体如下：</p>\n<p>打开me.huding.luobo.back.StaticsUtils.java文件，将：</p>\n<pre><code>/**\n     * 生成静态化的HTML的相对URL\n     * @param value\n     * @return\n     */\n    public static String genHtmlURL(String value){\n        return Parameters.ARTICLES_PATH + \"/\" + value;\n    }\n</code></pre><p>替换为：</p>\n<pre><code>/**\n     * 生成静态化的HTML的相对URL\n     * @param value\n     * @return\n     */\n    public static String genHtmlURL(String value){\n        return value;\n    }\n</code></pre><p>同时将</p>\n<pre><code>public static String genPath(String url){\n        return Parameters.STATICS_FINAL_PATH + url;\n}\n</code></pre><p>替换为：</p>\n<pre><code>public static String genPath(String url){\n        return Parameters.STATICS_FINAL_PATH + File.separator + url;\n}\n</code></pre><h3 id=\"h3-u8FD0u884Cu9879u76EE\"><a name=\"运行项目\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>运行项目</h3><p>直接运行me.huding.luobo.AppConfig.java文件里的main方法即可，然后在浏览器的地址栏输入：</p>\n<pre><code>http://localhost:8080/luobo/qingcai-front/index.html\n</code></pre><p>就可以访问前台的博客系统了，在地址栏输入：</p>\n<pre><code>http://localhost:8080/luobo/qingcai-back/login.html\n</code></pre><p>输入默认的账号和密码：admin,123456，即可访问博客的后台管理系统。</p>\n<p>PS：本文写的不是很好啊，不喜勿喷啊！</p>\n','博客,浏览器,Eclipse,本地运行',0),
	('25e6009dc84e483293e30f8578be6382','LevelDB简介','胡建洪','LevelDB是Google开源的持久化KV单机数据库，具有很高的随机写，顺序读／写性能，但是随机读的性能很一般。适用场景是查询较少，而写很多的场景。LevelDB应用了LSM（Log Structured Merge)策略，LSM_TREE 对索引变更进行延迟及批量处理，并通过一种类似于归并排序的方式高效的将更新迁移到磁盘，降低索引插入开销。','新华社天津9月24日电（记者翟永冠　韩筱婧）随着近年来无人机技术和产业迅猛发展，“黑飞”现象普遍存在，对民航飞行安全等造成安全隐患。23日，由天津市宝坻区政府和中科院地理科学与资源研究所联合打造的京津翱翔基地正式揭牌，配备科学试验空域的基地，为无人机应用和管控科学研究提供专用规范化的场地。\n中国科学院副秘书长邓勇介绍，该试验基地由研究所、地方政府、企业三方共建，场地拥有相关管理部门专门批准的科学试验空域。作为中国科学院无人机应用与管控研究中心的试验基地之一，京津翱翔基地为中科院完成国家科研任务研发和测试提供技术和平台支持，已经列入科学试验计划的研究有无人机组网观测、电子地理围栏管控系统、低空航路构建关键技术、雷达载荷平台一体化，复合旋变翼、平台载荷轻量化标准化技术等试验。',0,0,12,'2017-09-05 22:20:19','http://localhost:8080/luobo/front/B20170924195943.html','22230A278ACA519F2A7721FFC1BB1090','4','2017-09-05 22:20:19','/Users/jianhonghu/Public/develop/java/luobo/src/main/webapp/front/B20170924195943.html',NULL,0,0,'发表','<h1 id=\"h1-leveldb-\"><a name=\"LevelDB简介\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>LevelDB简介</h1><p>LevelDB是Google开源的持久化KV单机数据库，具有很高的随机写，顺序读／写性能，但是随机读的性能很一般。适用场景是查询较少，而写很多的场景。LevelDB应用了LSM（Log Structured Merge)策略，LSM_TREE 对索引变更进行延迟及批量处理，并通过一种类似于归并排序的方式高效的将更新迁移到磁盘，降低索引插入开销。</p>\n<p>根据<a href=\"https://github.com/google/leveldb\">LevelDB官方网站</a>的描述，LevelDB的特点和限制如下：</p>\n<p>特点：</p>\n<ol>\n<li>key和value都是任意长度的字节数组；</li><li>数据根据key有序存储；</li><li>调用者可以提供自定义比较功能来覆盖排序顺序；</li><li>基本操作是Put(key,value),Get(key),Delete(key);</li><li>多个更改操作可以作为一个原子操作进行；</li><li>用户可以创建一个瞬时快照，以获得一致的数据视图；</li><li>在数据上支持向前和向后迭代；</li><li>适用Snappy压缩库自动压缩数据；</li><li>外部活动（如文件系统操作等）通过虚拟接口进行中继，因此用户可以自定义与操作系统的交互。</li></ol>\n<p>限制：</p>\n<ol>\n<li>这不是SQL数据库。它没有关系数据模型，它不支持SQL查询，并且它不支持索引。</li><li>在同一时刻只能有一个进程（可能是多线程）访问一个特定的数据库；</li><li>在库中没有内置客户端-服务器支持。需要这种支持的应用程序将不得不将自己的服务器包装在库中。</li></ol>\n','LevelDB,数据库',0),
	('29a97996e69842c09ccf8f9b8424be68','csa','fda','dfa','新华社天津9月24日电（记者翟永冠　韩筱婧）随着近年来无人机技术和产业迅猛发展，“黑飞”现象普遍存在，对民航飞行安全等造成安全隐患。23日，由天津市宝坻区政府和中科院地理科学与资源研究所联合打造的京津翱翔基地正式揭牌，配备科学试验空域的基地，为无人机应用和管控科学研究提供专用规范化的场地。\n中国科学院副秘书长邓勇介绍，该试验基地由研究所、地方政府、企业三方共建，场地拥有相关管理部门专门批准的科学试验空域。作为中国科学院无人机应用与管控研究中心的试验基地之一，京津翱翔基地为中科院完成国家科研任务研发和测试提供技术和平台支持，已经列入科学试验计划的研究有无人机组网观测、电子地理围栏管控系统、低空航路构建关键技术、雷达载荷平台一体化，复合旋变翼、平台载荷轻量化标准化技术等试验。',0,9,11,'2017-09-24 19:59:41','http://localhost:8080/luobo/front/B20170924195944.html','4F4D84BB48479CDB8F06B4C8835FCF92','0deaf97437264ce69eac4f70cf8cb8f1','2017-09-24 19:59:41','/Users/jianhonghu/Public/develop/java/luobo/src/main/webapp/front/B20170924195944.html',NULL,0,0,'发表','<p>dfa</p>\n','fa,da',0),
	('5a823d3753b945e98696a83fe779bf3b','从零开始搭建个人博客站概述','胡建洪','大概在2016年7月份，在看别人的个人博客系统时，脑子里产生了一个想法，作为程序员出身，为什么不自己开发一个博客系统，检验并锻炼下自己的编程水平，就这样一言不合就开始了开发个人博客系统不归之路，好在最后小有成果，没有留下遗憾。','新华社天津9月24日电（记者翟永冠　韩筱婧）随着近年来无人机技术和产业迅猛发展，“黑飞”现象普遍存在，对民航飞行安全等造成安全隐患。23日，由天津市宝坻区政府和中科院地理科学与资源研究所联合打造的京津翱翔基地正式揭牌，配备科学试验空域的基地，为无人机应用和管控科学研究提供专用规范化的场地。\n中国科学院副秘书长邓勇介绍，该试验基地由研究所、地方政府、企业三方共建，场地拥有相关管理部门专门批准的科学试验空域。作为中国科学院无人机应用与管控研究中心的试验基地之一，京津翱翔基地为中科院完成国家科研任务研发和测试提供技术和平台支持，已经列入科学试验计划的研究有无人机组网观测、电子地理围栏管控系统、低空航路构建关键技术、雷达载荷平台一体化，复合旋变翼、平台载荷轻量化标准化技术等试验。',12,365,869,'2017-02-15 15:26:06','http://localhost:8080/luobo/front/B20170924195945.html','8B296771A9D0F80A9EB38894151A0CDA','18f3adde58d0497393f35e653b95aff8','2017-02-15 15:26:06','/Users/jianhonghu/Public/develop/java/luobo/src/main/webapp/front/B20170924195945.html','http://localhost:8080/luobo/front/static/img/01.jpg',1,0,'发表','<p>大概在2016年7月份，在看别人的个人博客系统时，脑子里产生了一个想法，作为程序员出身，为什么不自己开发一个博客系统，检验并锻炼下自己的编程水平，就这样一言不合就开始了开发个人博客系统不归之路，好在最后小有成果，没有留下遗憾。闲话少说，下面开始谈谈我是如何从零开始搭建个人博客系统的。主要准备工作主要有：</p>\n<ol>\n<li>注册域名</li><li>购买主机</li><li>域名解析</li><li>域名备案</li><li>系统开发</li><li>系统部署</li></ol>\n<h2 id=\"h2-u6CE8u518Cu57DFu540D\"><a name=\"注册域名\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>注册域名</h2><p>国内的域名服务提供商比较靠谱的阿里云的万网（<a href=\"https://wanwang.aliyun.com\" title=\"域名注册_虚拟主机_云服务器_企业邮箱-万网-阿里云旗下品牌\">域名注册<em>虚拟主机</em>云服务器_企业邮箱-万网-阿里云旗下品牌</a>），腾讯云的新网（<a href=\"https://dnspod.qcloud.com\" title=\"域名注册 - 腾讯云\">域名注册 - 腾讯云</a>）等。我是在阿里云的万网上注册了一个域名huding.name。</p>\n<h2 id=\"h2-u8D2Du4E70u4E3Bu673A\"><a name=\"购买主机\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>购买主机</h2><p>因为之前做项目的时候使用过阿里云的主机，对阿里云的印象还是蛮好的，所以我开始打算使用阿里云的，但是后来发现太贵了，学生党实在负担不起。后来发现腾讯云推出了学生机(<a href=\"https://www.qcloud.com/act/campus\" title=\"云+校园计划 - 腾讯云，值得信赖\">云+校园计划 - 腾讯云，值得信赖</a>)，每个月只需1元。虽然阿里云也有学生机，但是申请过程较为麻烦，而且费用也比腾讯云贵，因此果断选择腾讯云。</p>\n<h2 id=\"h2-u57DFu540Du89E3u6790\"><a name=\"域名解析\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>域名解析</h2><p>域名解析主要是在域名服务提供商那里将自己注册的域名解析到主机的IP地址。写到这里我就笑了，我居然已经使用国内互联网三大巨头中两家提供的服务了，即使用了阿里的域名服务和腾讯云的主机服务。还有更可笑的是，我后面为了方便统计访客数，又使用了百度的百度统计，我也是跪了这次，第一次搞一个简单的博客系统就使用了BAT三巨头的不同服务。</p>\n<h2 id=\"h2-u57DFu540Du5907u6848\"><a name=\"域名备案\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>域名备案</h2><p>域名备案主要是主机服务提供商那里提交材料进行域名备案，至于怎么备案，主机服务提供商都会提供详细的教程的。PS：只要是在中国大陆的主机都要备案才能正常访问。</p>\n<h2 id=\"h2-u7CFBu7EDFu5F00u53D1\"><a name=\"系统开发\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>系统开发</h2><p>做好前面的准备的开发工作后，我就开始进行实际的代码开发了。我本身对Java比较熟悉点，因此使用Java作为后端开发语言，前端开发语言为：html，js，css等。由于我的前端水平不高，让我从头开始编写代码，不知道要写到猴年马月去了。因此我就找了几款框架，在框架的基础上进行开发，能够达到事半功倍的效果。这几款框架分别是：</p>\n<p>Java框架：JFinal(<a href=\"http://www.jfinal.com/\">http://www.jfinal.com/</a>)<br>前端框架：amazeui(<a href=\"http://amazeui.org\" title=\"中国首个开源 HTML5 跨屏前端框架\">中国首个开源 HTML5 跨屏前端框架</a>）,layui（<a href=\"http://www.layui.com\" title=\"layui - 经典模块化前端框架\">layui - 经典模块化前端框架</a>）。使用amazeui的特性实现屏幕适配，自适应屏幕。使用layui的特性实现前端脚本处理逻辑，实现与后台的交互。<br>开发方式是前后端完全分离，因此我借助Nginx服务器实现连接前端和后端，实现前后端通信。\n<p>最终的开发效果也是蛮好的，前端的博客内容展示：</p>\n<h3 id=\"h3-1-pc-\"><a name=\"1.PC端效果\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>1.PC端效果</h3><p><img src=\"http://static.huding.name/image/fc4651349ded4cd0852be288bbdbea6a.png\" alt=\"\">\n<h3 id=\"h3-2-\"><a name=\"2.移动端效果\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>2.移动端效果</h3><p><img src=\"http://static.huding.name/image/fa62f128b4184dafabcde954ad57efcc.png\" alt=\"\">\n<h3 id=\"h3-3-\"><a name=\"3.后台管理系统\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>3.后台管理系统</h3><p><img src=\"http://static.huding.name/image/82f602d709ed45d18de11a605c2e6c7a.png\" alt=\"\">\n<h2 id=\"h2-u7CFBu7EDFu90E8u7F72\"><a name=\"系统部署\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>系统部署</h2><p>这部分暂略。大体上是在服务器端安装JDK，Nginx，Tomcat等相关部署软件，设置相应的配置后，将自己开发的系统部署到相应的目录下就好了。</p>\n<h2 id=\"h2-u7ED3u675Fu8BED\"><a name=\"结束语\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>结束语</h2><p>最终经过自己不断地捣鼓，我的个人博客<a href=\"http://www.huding.name\" title=\"青菜萝卜胡丁程序员技术分享博客\">青菜萝卜胡丁程序员技术分享博客</a>最终在2017年2月10日上线了。虽然我的代码写的不是很好，但本着开源精神，我将这个博客系统的代码开源在<a href=\"https://github.com/hujianhong\" title=\"GitHub\">GitHub</a>上了<a href=\"https://github.com/hujianhong/blog\" title=\"个人博客系统(青菜萝卜胡丁程序员技术分享博客)\">个人博客系统(青菜萝卜胡丁程序员技术分享博客)</a>。有需要的童鞋可以到这里去下载。</p>\n','域名,GitHub,layui,博客',0),
	('b79881401ed843f49becf79d92dd372d','linux的alias命令','胡建洪','alias命令用来设置指令的别名。我们可以使用该命令可以将一些较长的命令进行简化。使用alias时，用户必须使用单引号\'\'将原来的命令引起来，防止特殊字符导致错误。\n','新华社天津9月24日电（记者翟永冠　韩筱婧）随着近年来无人机技术和产业迅猛发展，“黑飞”现象普遍存在，对民航飞行安全等造成安全隐患。23日，由天津市宝坻区政府和中科院地理科学与资源研究所联合打造的京津翱翔基地正式揭牌，配备科学试验空域的基地，为无人机应用和管控科学研究提供专用规范化的场地。\n中国科学院副秘书长邓勇介绍，该试验基地由研究所、地方政府、企业三方共建，场地拥有相关管理部门专门批准的科学试验空域。作为中国科学院无人机应用与管控研究中心的试验基地之一，京津翱翔基地为中科院完成国家科研任务研发和测试提供技术和平台支持，已经列入科学试验计划的研究有无人机组网观测、电子地理围栏管控系统、低空航路构建关键技术、雷达载荷平台一体化，复合旋变翼、平台载荷轻量化标准化技术等试验。',0,0,12,'2017-09-11 19:15:04','http://localhost:8080/luobo/front/B20170924195946.html','9FCA62AB255C29442073290C047F3A8E','8a1aeb3e96dd48b7873d9100062cd8d6','2017-09-11 19:15:04','/Users/jianhonghu/Public/develop/java/luobo/src/main/webapp/front/B20170924195946.html',NULL,0,0,'发表','<p>alias命令用来设置指令的别名。我们可以使用该命令可以将一些较长的命令进行简化。使用alias时，用户必须使用单引号’’将原来的命令引起来，防止特殊字符导致错误。</p>\n<p>alias命令的作用只限于该次登入的操作。若要每次登入都能够使用这些命令别名，则可将相应的alias命令存放到/etc/profile或者自己的～/.bash_profile中。</p>\n<h3 id=\"h3-u8BEDu6CD5\"><a name=\"语法\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>语法</h3><blockquote>\n<p>alias（选项）(参数)</p>\n</blockquote>\n<p>其中，选项：-p 打印已经设置的命令别名。参数：定义命令别名，格式为“命令别名=’实际命令’”。</p>\n<p>For example:</p>\n<blockquote>\n<p>alias mysql = ‘/usr/local/mysql/bin/mysql’</p>\n</blockquote>\n<p>如果要删除一个别名，则可直接使用<strong>unalias</strong>命令</p>\n<p>For example:</p>\n<blockquote>\n<p>unalias mysql</p>\n</blockquote>\n<p>若直接输入不带参数的alias命令，则直接列出当前系统中的所有已经定义的别名。</p>\n','alias,linux',0),
	('bd9567a036794a97bb6ada54a362b37d','mac下使用mysql控制台命令行','胡建洪','mac下使用mysql控制台命令行','mac下使用mysql控制台命令行\n\n命令行中输入\n\nopen .bash_profile\n\n然后将\n\nalias mysql=/usr/local/mysql/bin/mysql\nalias mysqladmin=/usr/local/mysql/bin/mysqladmin\n\n追加到最后面，如果文件不存在，自己创建一个就可以了\n\n然后保存\n\n然后输入\n\nsource .bash_profile\n\n最后就能使用mysql来使用shell来使用控制台命令了',3,135,156,'2017-04-12 09:16:46','http://localhost:8080/luobo/front/B20170924195947.html','6D5CF780D1A0B37853073AC63E30A2CE','330f029b812441db9bffa936f702071f','2017-04-12 09:16:46','/Users/jianhonghu/Public/develop/java/luobo/src/main/webapp/front/B20170924195947.html',NULL,0,0,'发表','<p>mac下使用mysql控制台命令行</p>\n<p>命令行中输入</p>\n<p>open .bash_profile</p>\n<p>然后将</p>\n<p>alias mysql=/usr/local/mysql/bin/mysql<br>alias mysqladmin=/usr/local/mysql/bin/mysqladmin\n<p>追加到最后面，如果文件不存在，自己创建一个就可以了</p>\n<p>然后保存</p>\n<p>然后输入</p>\n<p>source .bash_profile</p>\n<p>最后就能使用mysql来使用shell来使用控制台命令了</p>\n','MAC,MySQL',0),
	('c088cee7075c4a70a8b87bf5ba0b3813','剑指Offer之用两个栈实现队列','胡建洪','用两个栈来实现一个队列，完成队列的Push和Pop操作。 队列中的元素为int类型。','新华社天津9月24日电（记者翟永冠　韩筱婧）随着近年来无人机技术和产业迅猛发展，“黑飞”现象普遍存在，对民航飞行安全等造成安全隐患。23日，由天津市宝坻区政府和中科院地理科学与资源研究所联合打造的京津翱翔基地正式揭牌，配备科学试验空域的基地，为无人机应用和管控科学研究提供专用规范化的场地。\n中国科学院副秘书长邓勇介绍，该试验基地由研究所、地方政府、企业三方共建，场地拥有相关管理部门专门批准的科学试验空域。作为中国科学院无人机应用与管控研究中心的试验基地之一，京津翱翔基地为中科院完成国家科研任务研发和测试提供技术和平台支持，已经列入科学试验计划的研究有无人机组网观测、电子地理围栏管控系统、低空航路构建关键技术、雷达载荷平台一体化，复合旋变翼、平台载荷轻量化标准化技术等试验。',2,77,83,'2017-02-20 21:37:21','http://localhost:8080/luobo/front/B20170924195948.html','A7E48BA53772E4FD5E2178CF206D5BF9','94c47580980144ecbd3d5f3984a02087','2017-02-20 21:37:21','/Users/jianhonghu/Public/develop/java/luobo/src/main/webapp/front/B20170924195948.html','null',0,0,'发表','<p>用两个栈来实现一个队列，完成队列的Push和Pop操作。 队列中的元素为int类型。</p>\n<pre><code>import java.util.Stack;\n\npublic class Solution {\n    Stack&lt;Integer&gt; stack1 = new Stack&lt;Integer&gt;();\n    Stack&lt;Integer&gt; stack2 = new Stack&lt;Integer&gt;();\n\n    public void push(int node) {\n        stack1.push(node);\n    }\n\n    public int pop() {\n        if(stack2.isEmpty()){\n            while(!stack1.isEmpty()){\n                stack2.push(stack1.pop());\n            }\n\n        } \n        return stack2.pop();\n\n    }\n}\n</code></pre>','队列,栈,数据结构',0),
	('cb7fdf7d43924bd198d86fa6208db44b','2014年12月CCF真题1 门禁系统','胡建洪','涛涛最近要负责图书馆的管理工作，需要记录下每天读者的到访情况。每位读者有一个编号，每条记录用读者的编号来表示。给出读者的来访记录，请问每一条记录中的读者是第几次出现。','新华社天津9月24日电（记者翟永冠　韩筱婧）随着近年来无人机技术和产业迅猛发展，“黑飞”现象普遍存在，对民航飞行安全等造成安全隐患。23日，由天津市宝坻区政府和中科院地理科学与资源研究所联合打造的京津翱翔基地正式揭牌，配备科学试验空域的基地，为无人机应用和管控科学研究提供专用规范化的场地。\n中国科学院副秘书长邓勇介绍，该试验基地由研究所、地方政府、企业三方共建，场地拥有相关管理部门专门批准的科学试验空域。作为中国科学院无人机应用与管控研究中心的试验基地之一，京津翱翔基地为中科院完成国家科研任务研发和测试提供技术和平台支持，已经列入科学试验计划的研究有无人机组网观测、电子地理围栏管控系统、低空航路构建关键技术、雷达载荷平台一体化，复合旋变翼、平台载荷轻量化标准化技术等试验。',2,9,135,'2017-02-08 16:15:23','http://localhost:8080/luobo/front/B20170924195949.html','3AD1ED190DCA0B50741859826E82305E','0deaf97437264ce69eac4f70cf8cb8f1','2017-02-08 16:15:23','/Users/jianhonghu/Public/develop/java/luobo/src/main/webapp/front/B20170924195949.html',NULL,0,0,'发表','<p>问题描述</p>\n<p>　　涛涛最近要负责图书馆的管理工作，需要记录下每天读者的到访情况。每位读者有一个编号，每条记录用读者的编号来表示。给出读者的来访记录，请问每一条记录中的读者是第几次出现。</p>\n<p>输入格式</p>\n<p>　　输入的第一行包含一个整数n，表示涛涛的记录条数。<br>　　第二行包含n个整数，依次表示涛涛的记录中每位读者的编号。\n<p>输出格式</p>\n<p>　　输出一行，包含n个整数，由空格分隔，依次表示每条记录中的读者编号是第几次出现。</p>\n<p>样例输入</p>\n<p>5<br>1 2 1 1 3\n<p>样例输出</p>\n<p>1 1 2 3 1</p>\n<p>评测用例规模与约定</p>\n<p>　　1≤n≤1,000，读者的编号为不超过n的正整数。</p>\n<pre><code>import java.util.Scanner;\n\npublic class Main {\n\n    public static void main(String[] args) {\n        Scanner scanner = new Scanner(System.in);\n        int n = scanner.nextInt();\n        int num[] = new int[n];\n        for(int i = 0; i &lt; n; i ++){\n            int k = scanner.nextInt();\n            num[k] ++;\n            if(i != n - 1){\n                System.out.print(num[k] + \" \");\n            } else {\n                System.out.print(num[k]);\n            }\n        }\n        System.out.println();\n        scanner.close();\n    }\n}\n</code></pre>','CCF,java,数据结构',0),
	('d8f415182fa84602a1e021a4937a22f7','2015年9月CCF真题4 高速公路','胡建洪','某国有n个城市，为了使得城市间的交通更便利，该国国王打算在城市之间修一些高速公路，由于经费限制，国王打算第一阶段先在部分城市之间修一些单向的高速公路。现在，大臣们帮国王拟了一个修高速公路的计划。看了计划后，国王发现，有些城市之间可以通过高速公路直接（不经过其他城市）或间接（经过一个或多个其他城市）到达，而有的却不能。如果城市A可以通过高速公路到达城市B，而且城市B也可以通过高速公路到达城市A，则这两个城市被称为便利城市对。国王想知道，在大臣们给他的计划中，有多少个便利城市对。','新华社天津9月24日电（记者翟永冠　韩筱婧）随着近年来无人机技术和产业迅猛发展，“黑飞”现象普遍存在，对民航飞行安全等造成安全隐患。23日，由天津市宝坻区政府和中科院地理科学与资源研究所联合打造的京津翱翔基地正式揭牌，配备科学试验空域的基地，为无人机应用和管控科学研究提供专用规范化的场地。\n中国科学院副秘书长邓勇介绍，该试验基地由研究所、地方政府、企业三方共建，场地拥有相关管理部门专门批准的科学试验空域。作为中国科学院无人机应用与管控研究中心的试验基地之一，京津翱翔基地为中科院完成国家科研任务研发和测试提供技术和平台支持，已经列入科学试验计划的研究有无人机组网观测、电子地理围栏管控系统、低空航路构建关键技术、雷达载荷平台一体化，复合旋变翼、平台载荷轻量化标准化技术等试验。',0,1,78,'2017-02-07 23:42:46','http://localhost:8080/luobo/front/B201709241959410.html','87EDDC788E020D567053549CDE946ED5','0deaf97437264ce69eac4f70cf8cb8f1','2017-02-07 23:42:46','/Users/jianhonghu/Public/develop/java/luobo/src/main/webapp/front/B201709241959410.html',NULL,0,0,'发表','<p>问题描述</p>\n<p>　　某国有n个城市，为了使得城市间的交通更便利，该国国王打算在城市之间修一些高速公路，由于经费限制，国王打算第一阶段先在部分城市之间修一些单向的高速公路。<br>　　现在，大臣们帮国王拟了一个修高速公路的计划。看了计划后，国王发现，有些城市之间可以通过高速公路直接（不经过其他城市）或间接（经过一个或多个其他城市）到达，而有的却不能。如果城市A可以通过高速公路到达城市B，而且城市B也可以通过高速公路到达城市A，则这两个城市被称为便利城市对。<br>　　国王想知道，在大臣们给他的计划中，有多少个便利城市对。\n<p>输入格式</p>\n<p>　　输入的第一行包含两个整数n, m，分别表示城市和单向高速公路的数量。<br>　　接下来m行，每行两个整数a, b，表示城市a有一条单向的高速公路连向城市b。\n<p>输出格式</p>\n<p>　　输出一行，包含一个整数，表示便利城市对的数量。</p>\n<p>样例输入</p>\n<p>5 5<br>1 2<br>2 3<br>3 4<br>4 2<br>3 5\n<p>样例输出</p>\n<p>3</p>\n<p>样例说明<br><img src=\"http://static.huding.name/image/30d7399297254131903849b7f6861e07.jpg\" alt=\"\">\n<p>　　城市间的连接如图所示。有3个便利城市对，它们分别是(2, 3), (2, 4), (3, 4)，请注意(2, 3)和(3, 2)看成同一个便利城市对。</p>\n<p>评测用例规模与约定</p>\n<p>　　前30%的评测用例满足1 ≤ n ≤ 100, 1 ≤ m ≤ 1000；<br>　　前60%的评测用例满足1 ≤ n ≤ 1000, 1 ≤ m ≤ 10000；<br>　　所有评测用例满足1 ≤ n ≤ 10000, 1 ≤ m ≤ 100000。\n<pre><code>import java.util.Scanner;\nimport java.util.Stack;\nimport java.util.Vector;\npublic class Main {\n\n    public static int MAX = 10005;\n\n    public static Vector[] gra = new Vector[MAX];\n\n    public static int[] dfn = new int[MAX];\n\n    public static int[] low = new int[MAX];\n\n    public static int[] InComponent = new int[MAX];\n\n    public static int[] Instack = new int[MAX];\n\n    public static Stack&lt;Integer&gt; sta = new Stack&lt;Integer&gt;();;\n\n    public static int index = 0,ComponentNumber = 0;\n\n\n    public static void tarjan(int u)  \n    {  \n\n        low[u] = dfn[u] = ++ index;  \n        sta.push(u);  \n        Instack[u] = 2;  \n        for (int i = 0; gra[u] != null &amp;&amp; i &lt; gra[u].size(); ++ i)  \n        {  \n            int t = (int) gra[u].get(i);  \n            if (dfn[t] == 0)  \n            {  \n                tarjan(t);  \n                low[u] = Math.min(low[u], low[t]);  \n            }   \n            else if (Instack[t] == 2)  \n            {  \n                low[u] =  Math.min(low[u], dfn[t]);  \n            }  \n        }  \n\n        if (low[u] == dfn[u])  \n        {  \n            ++ ComponentNumber;  \n            while (!sta.empty())  \n            {  \n                int j = sta.pop();  \n                Instack[j] = 1;  \n                InComponent[j]=ComponentNumber;  \n                if (j == u)  {\n                   break;\n                }\n            }  \n        }  \n    }  \n\n    public static int[] v = new int[MAX];\n\n    public static void main(String[] args) {\n        Scanner scanner = new Scanner(System.in);\n        int n = scanner.nextInt();\n        int m = scanner.nextInt();\n        for(int i = 0; i &lt; m ;i ++){\n            int h = scanner.nextInt();\n            int t = scanner.nextInt();\n            if(gra[h] == null){\n                gra[h] = new Vector();\n            }\n            gra[h].add(t);\n        }\n        for(int i = 1;i &lt;= n; i ++){\n            if(dfn[i] ==  0){\n                tarjan(i);\n            }\n        }\n        for(int i = 1; i &lt;= n; i ++){\n            v[InComponent[i]] ++;\n        }\n\n        int sum = 0;\n\n        for(int i = 1;i &lt;= n; i++){\n            if(v[i] &gt; 1){\n                sum += (v[i] * (v[i] - 1)) / 2;\n            }\n        }\n        System.out.println(sum);\n        scanner.close();\n    }\n</code></pre><p>   在系统中得分90分，剩下10分运行超时未得分</p>\n','CCF,tarjan,图',NULL),
	('e045b65486664c67820ef9f7f4b81542','Java体系结构概念图描述','胡建洪','Java体系结构概念图描述','新华社天津9月24日电（记者翟永冠　韩筱婧）随着近年来无人机技术和产业迅猛发展，“黑飞”现象普遍存在，对民航飞行安全等造成安全隐患。23日，由天津市宝坻区政府和中科院地理科学与资源研究所联合打造的京津翱翔基地正式揭牌，配备科学试验空域的基地，为无人机应用和管控科学研究提供专用规范化的场地。\n中国科学院副秘书长邓勇介绍，该试验基地由研究所、地方政府、企业三方共建，场地拥有相关管理部门专门批准的科学试验空域。作为中国科学院无人机应用与管控研究中心的试验基地之一，京津翱翔基地为中科院完成国家科研任务研发和测试提供技术和平台支持，已经列入科学试验计划的研究有无人机组网观测、电子地理围栏管控系统、低空航路构建关键技术、雷达载荷平台一体化，复合旋变翼、平台载荷轻量化标准化技术等试验。',7,50,234,'2017-02-14 21:03:46','http://localhost:8080/luobo/front/B201709241959411.html','5D32F08A72E891539669B4EAFFA58D50','aab2e1cb0e4148c4b081df9940c2800a','2017-02-14 21:03:46','/Users/jianhonghu/Public/develop/java/luobo/src/main/webapp/front/B201709241959411.html','http://localhost:8080/luobo/front/static/img/01.jpg',1,0,'发表','<p>Java体系结构概念图描述</p>\n<p>Java6<br><img src=\"http://static.huding.name/image/83f99c8ea5904205bac1aa15af8eda78.png\" alt=\"\"><br>Java7<br><img src=\"http://static.huding.name/image/d46782df766a4a24b36cc5d2a52308f4.png\" alt=\"\"><br>Java8<br><img src=\"http://static.huding.name/image/801bc64ce87d4792a540c462c91776d1.png\" alt=\"Java8\" title=\"Java8\">\n','Java,JDK,JRE',0),
	('e2de2c2fb832430687bffc4217dec1d7','Java的BufferedReader类学习笔记','胡建洪','BufferedReader由Reader类扩展而来，提供通用的缓冲方式文本读取，而且提供了很实用的readLine，读取一个文本行，从字符输入流中读取文本，缓冲各个字符，从而提供字符、数组和行的高效读取。','新华社天津9月24日电（记者翟永冠　韩筱婧）随着近年来无人机技术和产业迅猛发展，“黑飞”现象普遍存在，对民航飞行安全等造成安全隐患。23日，由天津市宝坻区政府和中科院地理科学与资源研究所联合打造的京津翱翔基地正式揭牌，配备科学试验空域的基地，为无人机应用和管控科学研究提供专用规范化的场地。\n中国科学院副秘书长邓勇介绍，该试验基地由研究所、地方政府、企业三方共建，场地拥有相关管理部门专门批准的科学试验空域。作为中国科学院无人机应用与管控研究中心的试验基地之一，京津翱翔基地为中科院完成国家科研任务研发和测试提供技术和平台支持，已经列入科学试验计划的研究有无人机组网观测、电子地理围栏管控系统、低空航路构建关键技术、雷达载荷平台一体化，复合旋变翼、平台载荷轻量化标准化技术等试验。',0,41,103,'2017-03-07 10:34:24','http://localhost:8080/luobo/front/B201709241959412.html','4098DCBD538FDA1CCA0BC7BB75A87B6E','aab2e1cb0e4148c4b081df9940c2800a','2017-03-07 10:34:24','/Users/jianhonghu/Public/develop/java/luobo/src/main/webapp/front/B201709241959412.html',NULL,0,0,'发表','<p>BufferedReader由Reader类扩展而来，提供通用的缓冲方式文本读取，而且提供了很实用的readLine，读取一个文本行，从字符输入流中读取文本，缓冲各个字符，从而提供字符、数组和行的高效读取。</p>\n<p>BufferedReader的主要方法</p>\n<p>构造方法：</p>\n<pre><code>BufferedReader br = new BufferReader(Reader in);\n</code></pre><p>主要方法：</p>\n<pre><code>int read();//读取单个字符。\n//将字符读入到数组的某一部分。返回读取的字符数。达到尾部 ，返回-1。\nint read(char[] cbuf,int off,int len);\nString readLine();//读取一个文本行。\nvoid close(); //关闭该流。并释放与该流相关的所有资源。\n</code></pre><p>今天在学习Java的BIO（blocking IO）的时候，在读取socket的输入流数据时，采用了BufferdReader的readLine方法，发现一直阻塞。后来才发现使用readLine方法读取一行必须要有“\\r\\n“，否则会一直阻塞到Socket超时或者IO异常。下面是我测试时的代码：</p>\n<h2 id=\"h2-u672Au6B63u5E38u5904u7406u7684u4EE3u7801\"><a name=\"未正常处理的代码\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>未正常处理的代码</h2><p>BIOClient：</p>\n<pre><code>package me.huding.study.distributed;\n\nimport java.io.BufferedReader;\nimport java.io.IOException;\nimport java.io.InputStreamReader;\nimport java.io.PrintWriter;\nimport java.net.Socket;\nimport java.net.UnknownHostException;\n\npublic class BIOClient {\n    public static void main(String[] args) throws UnknownHostException, IOException {\n        Socket socket = new Socket(\"localhost\", 7878);\n        socket.setSoTimeout(30000);\n        BufferedReader reader = new BufferedReader(new InputStreamReader(socket.getInputStream()));\n        PrintWriter writer = new PrintWriter(socket.getOutputStream(),true);\n        writer.write(\"hello server\");\n        writer.flush();\n        String string = reader.readLine();\n        System.out.println(string);\n        socket.close();\n\n    }\n}\n</code></pre><p>BIOServer:</p>\n<pre><code>package me.huding.study.distributed;\n\nimport java.io.BufferedReader;\nimport java.io.IOException;\nimport java.io.InputStreamReader;\nimport java.io.PrintWriter;\nimport java.net.ServerSocket;\nimport java.net.Socket;\nimport java.net.UnknownHostException;\n\npublic class BIOServer {\n\n    public static void main(String[] args) throws UnknownHostException, IOException {\n        ServerSocket serverSocket = new ServerSocket(7878);\n        Socket socket = serverSocket.accept();\n        BufferedReader reader = new BufferedReader(new InputStreamReader(socket.getInputStream()));\n        String string = reader.readLine();\n        System.out.println(string);\n        PrintWriter writer = new PrintWriter(socket.getOutputStream(), true);\n        writer.write(\"hello client\");\n        writer.flush();\n        socket.close();\n    }\n}\n</code></pre><p>先运行BIOServer，在运行BIOClient，会发现控制台没有输出预期的结果，即BIOServer输出“hello Server”,BIOClient输出“hello client”，而是输出这样的结果：</p>\n<p>BIOServer的结果：</p>\n<pre><code>hello server\n</code></pre><p>BIOClient的结果：</p>\n<pre><code>Exception in thread \"main\" java.net.SocketTimeoutException: Read timed out\n    at java.net.SocketInputStream.socketRead0(Native Method)\n    at java.net.SocketInputStream.socketRead(SocketInputStream.java:116)\n    at java.net.SocketInputStream.read(SocketInputStream.java:170)\n    at java.net.SocketInputStream.read(SocketInputStream.java:141)\n    at sun.nio.cs.StreamDecoder.readBytes(StreamDecoder.java:284)\n    at sun.nio.cs.StreamDecoder.implRead(StreamDecoder.java:326)\n    at sun.nio.cs.StreamDecoder.read(StreamDecoder.java:178)\n    at java.io.InputStreamReader.read(InputStreamReader.java:184)\n    at java.io.BufferedReader.fill(BufferedReader.java:161)\n    at java.io.BufferedReader.readLine(BufferedReader.java:324)\n    at java.io.BufferedReader.readLine(BufferedReader.java:389)\n    at me.huding.study.distributed.BIOClient.main(BIOClient.java:18)\n</code></pre><p>其中BIOClient的结果是因为Socket读取超时出现的。经过简单思考，只要分别将BIOClient的第16行的代码换成：writer.write(“hello server\\r\\n”);或者writer.println(“hello server”);,将BIOServer的第20行代码替换成：writer.write(“hello client\\r\\n”);或者writer.println(“hello client”);然后分别运行BIOServer和BIOClient的代码，就可以出线理想的结果：</p>\n<p>BIOClient的结果：</p>\n<pre><code>hello client\n</code></pre><p>BIOServer的结果：</p>\n<pre><code>hello server\n</code></pre><h2 id=\"h2-u603Bu7ED3\"><a name=\"总结\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>总结</h2><p>虽然我在学习Java的IO方面的小小的插曲，但是如果我没有注意到这点，可能以后在写一些生产环境用的的系统时，会出现致命的问题。生活如此艰辛，学习过程还需时刻谨慎小心啊！</p>\n','Java,IO,Socket',0),
	('f584b7d7774b437a87290a072dfb9a02','剑指Offer之第一个只出现一次的字符位置','胡建洪','在一个字符串(1<=字符串长度<=10000，全部由大写字母组成)中找到第一个只出现一次的字符,并返回它的位置。','新华社天津9月24日电（记者翟永冠　韩筱婧）随着近年来无人机技术和产业迅猛发展，“黑飞”现象普遍存在，对民航飞行安全等造成安全隐患。23日，由天津市宝坻区政府和中科院地理科学与资源研究所联合打造的京津翱翔基地正式揭牌，配备科学试验空域的基地，为无人机应用和管控科学研究提供专用规范化的场地。\n中国科学院副秘书长邓勇介绍，该试验基地由研究所、地方政府、企业三方共建，场地拥有相关管理部门专门批准的科学试验空域。作为中国科学院无人机应用与管控研究中心的试验基地之一，京津翱翔基地为中科院完成国家科研任务研发和测试提供技术和平台支持，已经列入科学试验计划的研究有无人机组网观测、电子地理围栏管控系统、低空航路构建关键技术、雷达载荷平台一体化，复合旋变翼、平台载荷轻量化标准化技术等试验。',5,122,169,'2017-02-21 22:24:57','http://localhost:8080/luobo/front/B201709241959413.html','A3A38254E1F1422FD6DDC2F51DEB6320','94c47580980144ecbd3d5f3984a02087','2017-02-21 22:24:57','/Users/jianhonghu/Public/develop/java/luobo/src/main/webapp/front/B201709241959413.html',NULL,0,0,'发表','<p>在一个字符串(1&lt;=字符串长度&lt;=10000，全部由大写字母组成)中找到第一个只出现一次的字符,并返回它的位置。</p>\n<pre><code>public class Solution {\n    public int FirstNotRepeatingChar(String str) {\n        int len = str.length();\n        if(len == 0){\n            return -1;\n        }\n        int kl = 256;\n        int nums[] = new int[kl];\n        int index[] = new int[kl];\n        for(int i = 0;i &lt; len;i ++){\n            char ch = str.charAt(i);\n            nums[ch]++;\n            index[ch] = i;\n        }\n        int k = kl + 1;\n        for(int i = 0;i &lt; kl;i ++){\n            if(nums[i] == 1){\n                if(index[i] &lt; k){\n                    k = index[i];\n                }\n            }\n        }\n        return k;\n    }\n}\n</code></pre>','剑指offer',0);

UNLOCK TABLES;





CREATE TABLE `blog_tags` (
  `tagID` char(32) NOT NULL,
  `blogID` char(32) NOT NULL,
  PRIMARY KEY (`tagID`,`blogID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `blog_tags` WRITE;

INSERT INTO `blog_tags` (`tagID`, `blogID`)
VALUES
	('046A899EE7A6EC88D370211A518C9E80','702e8d5e18c04964b4da8ec48be50409'),
	('0796F7F8B93AD1204D4769C52AFF5284','c088cee7075c4a70a8b87bf5ba0b3813'),
	('0A5A4153B8FAB8B735400132F35570CD','3ba1267bf2c245bf88c3fc66b2e09013'),
	('0FEA7C47D93DA5689F31820EE525B367','702e8d5e18c04964b4da8ec48be50409'),
	('0FEA7C47D93DA5689F31820EE525B367','c088cee7075c4a70a8b87bf5ba0b3813'),
	('0FEA7C47D93DA5689F31820EE525B367','cb7fdf7d43924bd198d86fa6208db44b'),
	('1','1ca3888bf494480a81db9f577e362d07'),
	('1573C74E227F14DED2DAA71BB049ECDA','f4864b922fb1492e91a83e79d491fa3d'),
	('190980C7D0218074702264D8DA6E31E1','5a823d3753b945e98696a83fe779bf3b'),
	('21D68B2DE0E91DFB14942CA8AEA316FC','33a05aaedd7e4fd4ae47e25c7359b940'),
	('235D7BE86290BD05B9985C8A5B3713FD','61c3f6282f3b480e88b0c33d36d22410'),
	('235D7BE86290BD05B9985C8A5B3713FD','7f45a62e0eac4061936477babeee37aa'),
	('235D7BE86290BD05B9985C8A5B3713FD','cb7fdf7d43924bd198d86fa6208db44b'),
	('235D7BE86290BD05B9985C8A5B3713FD','d8f415182fa84602a1e021a4937a22f7'),
	('267595728BEB6EE41DFC9C862917055D','093dcae887cd4904b2d244fcdca5473a'),
	('2E25C285356CBB0ED8785A1377027D79','bd9567a036794a97bb6ada54a362b37d'),
	('32981A13284DB7A021131DF49E6CD203','0205d4b6d0914715970da8ca41c2c0d6'),
	('32F7222026696F30787889194DEE83E5','093dcae887cd4904b2d244fcdca5473a'),
	('36b487f38d114b10ae793ff58cf952fb','1ca3888bf494480a81db9f577e362d07'),
	('46CFF7C2E22C5FB804C02D5B561B39F8','e045b65486664c67820ef9f7f4b81542'),
	('48B26E4419603D55F8128747CFEE5E92','54a2a725cc2c4860808a66d7082e52c4'),
	('49EDAB1CB53BA3CF77C6C3271196ACBB','f4864b922fb1492e91a83e79d491fa3d'),
	('5','1ca3888bf494480a81db9f577e362d07'),
	('5','9b07036e1c04405f997aafd301e32bf0'),
	('50c61d9e506248ae8ad00539a8603ea6','1ca3888bf494480a81db9f577e362d07'),
	('558D23A4DCECDFDBE69B2C8BB50560A9','3ba1267bf2c245bf88c3fc66b2e09013'),
	('58463BDA2FB934A0ABC9E9A02C012A41','c088cee7075c4a70a8b87bf5ba0b3813'),
	('5A85E5CECB477D06AD59A113A1F6AE2C','25e6009dc84e483293e30f8578be6382'),
	('5BC06F5800D415CC95E1349EDBACA425','5fb856efa680421ea2290276dd37045e'),
	('5CA2AA845C8CD5ACE6B016841F100D82','29a97996e69842c09ccf8f9b8424be68'),
	('5CA2AA845C8CD5ACE6B016841F100D82','aa7a6dfbea4d4367b9c6e2dda277b4a6'),
	('5FC71C1AEC7C1753FA3596E8DDAD3C4C','e045b65486664c67820ef9f7f4b81542'),
	('62A004B95946BB97541AFA471DCCA73A','359a42eec11c4fee9351a2891bf2afa9'),
	('62A004B95946BB97541AFA471DCCA73A','bd9567a036794a97bb6ada54a362b37d'),
	('63DB5605AC2D3A21F0ABD506C9531209','7f45a62e0eac4061936477babeee37aa'),
	('63DB5605AC2D3A21F0ABD506C9531209','d8f415182fa84602a1e021a4937a22f7'),
	('6499CC2E7CB3DAAF2861D054ECF54B87','495fa978801d418a9b6ed475c989eaa1'),
	('66C260D88C897E6C6353F6DB6EACC3BD','359a42eec11c4fee9351a2891bf2afa9'),
	('68051BF4AA2743B030984B694628EE9C','25e6009dc84e483293e30f8578be6382'),
	('684892549c6f4df88e147eb0c252dcb6','1ca3888bf494480a81db9f577e362d07'),
	('684892549c6f4df88e147eb0c252dcb6','9b07036e1c04405f997aafd301e32bf0'),
	('69F69B59AAE6F4EE1A47BBC1086ECDB4','e2de2c2fb832430687bffc4217dec1d7'),
	('6A620E3C07048291FDB26B6EDCEE7ABA','3ddd409dfc9344449dac3717ecc75f72'),
	('6DE9E0AFBA7328E44B19153A6733835C','3ba1267bf2c245bf88c3fc66b2e09013'),
	('724874D1BE77F450A09B305FC1534AFB','b79881401ed843f49becf79d92dd372d'),
	('7898814832f34d91b9ed45eed7049837','1ca3888bf494480a81db9f577e362d07'),
	('7DDBE15C845FA27A2BAB496183042CA6','7f45a62e0eac4061936477babeee37aa'),
	('8178AD6FD9FE5CEEB9D3AA702AD45403','3ba1267bf2c245bf88c3fc66b2e09013'),
	('88EAEC4C7BC4EC29AFA783666D0B53BC','f584b7d7774b437a87290a072dfb9a02'),
	('8936F53B23E9DFE2965D9E2EC23A4779','54a2a725cc2c4860808a66d7082e52c4'),
	('89E6D2B383471FC370D828E552C19E65','29a97996e69842c09ccf8f9b8424be68'),
	('912302CB020149C37F9642FBC9E42891','093dcae887cd4904b2d244fcdca5473a'),
	('93F725A07423FE1C889F448B33D21F46','0205d4b6d0914715970da8ca41c2c0d6'),
	('93F725A07423FE1C889F448B33D21F46','cb7fdf7d43924bd198d86fa6208db44b'),
	('9778840A0100CB30C982876741B0B5A2','359a42eec11c4fee9351a2891bf2afa9'),
	('9ABFE4A03928EB88A75A5CD95822DFEF','5fb856efa680421ea2290276dd37045e'),
	('9D0F8F6F657186A8F0F18F1EA92D1C95','f4864b922fb1492e91a83e79d491fa3d'),
	('A5C5D0DC90CCF0733D65742D59D28CCC','00e05640cb9a4cef9ec0c355b4c4cd8c'),
	('a838b3281b5f471e8fe85aeae0eb0330','9b07036e1c04405f997aafd301e32bf0'),
	('AFAEF14EBCFFDF11EF0A5D3E61B50866','495fa978801d418a9b6ed475c989eaa1'),
	('B6747DD73070743AE1F68AD64A80E873','33a05aaedd7e4fd4ae47e25c7359b940'),
	('BEE912D79EEFB7335988C4997AA9138D','359a42eec11c4fee9351a2891bf2afa9'),
	('C50D13646EC66F1929DA5D491F2DFF0F','093dcae887cd4904b2d244fcdca5473a'),
	('C50D13646EC66F1929DA5D491F2DFF0F','5a823d3753b945e98696a83fe779bf3b'),
	('C72EC5AF9F5EC0DE360EC126CDA41672','f4864b922fb1492e91a83e79d491fa3d'),
	('C7A628CBA22E28EB17B5F5C6AE2A266A','0205d4b6d0914715970da8ca41c2c0d6'),
	('CCF','495fa978801d418a9b6ed475c989eaa1'),
	('CCF','7f45a62e0eac4061936477babeee37aa'),
	('CCF','cb7fdf7d43924bd198d86fa6208db44b'),
	('CCF','d8f415182fa84602a1e021a4937a22f7'),
	('CF3882F1C43AB22BFF0BD9D82D83251B','e2de2c2fb832430687bffc4217dec1d7'),
	('CF4F2BADD0AED460A7C0758AE4EC4874','3ba1267bf2c245bf88c3fc66b2e09013'),
	('css','0205d4b6d0914715970da8ca41c2c0d6'),
	('D276123C8BF8DABF3AE03A2A571ACD43','3ddd409dfc9344449dac3717ecc75f72'),
	('D3B7C913CD04EBFEC0E9EC32CB6FD58C','5a823d3753b945e98696a83fe779bf3b'),
	('D52387880E1EA22817A72D3759213819','00e05640cb9a4cef9ec0c355b4c4cd8c'),
	('D52387880E1EA22817A72D3759213819','3ddd409dfc9344449dac3717ecc75f72'),
	('D52387880E1EA22817A72D3759213819','e045b65486664c67820ef9f7f4b81542'),
	('D52387880E1EA22817A72D3759213819','e2de2c2fb832430687bffc4217dec1d7'),
	('D95200B7462824DA8D5C86DF1D944D7D','33a05aaedd7e4fd4ae47e25c7359b940'),
	('DA9B26CFD7DE4FB79CABBDBC8FA05F61','d8f415182fa84602a1e021a4937a22f7'),
	('DD29E7545EB8E590333BF6705D45BD71','5a823d3753b945e98696a83fe779bf3b'),
	('E0407C4DA384781218D7D89D043BA67B','61c3f6282f3b480e88b0c33d36d22410'),
	('E206A54E97690CCE50CC872DD70EE896','b79881401ed843f49becf79d92dd372d'),
	('e686c30979dd452f98a59a53f4d8487c','1ca3888bf494480a81db9f577e362d07'),
	('F88522CF1B8A99E869EE231AC97BBC86','3ddd409dfc9344449dac3717ecc75f72'),
	('FC35FDC70D5FC69D269883A822C7A53E','0205d4b6d0914715970da8ca41c2c0d6'),
	('html','0205d4b6d0914715970da8ca41c2c0d6'),
	('java','0205d4b6d0914715970da8ca41c2c0d6'),
	('js','0205d4b6d0914715970da8ca41c2c0d6');

UNLOCK TABLES;



CREATE TABLE `category` (
  `id` char(32) NOT NULL,
  `name` varchar(50) NOT NULL,
  `cdate` datetime DEFAULT NULL,
  `typeID` int(11) DEFAULT '1',
  `keywords` varchar(50) DEFAULT '',
  `blogNum` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `category` WRITE;

INSERT INTO `category` (`id`, `name`, `cdate`, `typeID`, `keywords`, `blogNum`)
VALUES
	('0deaf97437264ce69eac4f70cf8cb8f1','CCF','2017-02-13 23:32:29',6,'',8),
	('178ebabf0fa54c73b5a42264455c1c1d','Layui','2017-02-07 12:00:00',1,'',0),
	('17966703da9a4f9c8f5726e07a44b4c5','求职','2017-03-10 19:29:37',3,'',1),
	('18f3adde58d0497393f35e653b95aff8','Web开发','2017-02-15 14:33:29',1,'',2),
	('2c4a47850cff4955b9a1c6b09b17ea2f','LeetCode','2017-02-14 17:03:41',6,'',0),
	('330f029b812441db9bffa936f702071f','MySQL','2017-02-07 12:00:00',1,'',2),
	('37a822efa50140e88b78ae35e8e13b4f','随笔','2017-09-11 14:48:07',2,'随笔',2),
	('4','数据库','2017-02-07 12:00:00',1,'',1),
	('415f7f76f72c447290b3931af488374a','CSS','2017-02-07 12:00:00',1,'',0),
	('46850e2a0cfd40e1993ce825f4340f91','机器学习','2017-02-07 12:00:00',1,'数据挖掘',1),
	('6','Android','2017-02-07 12:00:00',1,'',0),
	('8a1aeb3e96dd48b7873d9100062cd8d6','Linux','2017-02-07 12:00:00',1,'',1),
	('8c1d8fe2a03d4a0688072f95fd6d8f68','数据结构','2017-02-18 21:23:13',1,'',1),
	('8dfb5b72bc69437c8cbc87594c47ea20','前端','2017-02-07 12:00:00',1,'',1),
	('94c47580980144ecbd3d5f3984a02087','剑指Offer','2017-02-20 21:33:49',6,'',2),
	('aab2e1cb0e4148c4b081df9940c2800a','Java','2017-02-07 12:00:00',1,'',4),
	('adc1e0953e324138b9ed6b0603a69373','Git','2017-02-07 12:00:00',1,'',0),
	('ce447e247965481baac6ea8745e49e43','Redis','2017-02-07 12:00:00',1,'',0),
	('e686c30979dd452f98a59a53f4d8487c','Python','2017-02-07 12:00:00',1,'',0);

UNLOCK TABLES;



CREATE TABLE `comment` (
  `id` char(32) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `cdate` datetime NOT NULL,
  `likeNum` int(11) NOT NULL DEFAULT '0',
  `hateNum` int(11) NOT NULL DEFAULT '0',
  `parent` char(32) DEFAULT NULL,
  `blogID` char(32) NOT NULL,
  `shareNum` int(11) NOT NULL DEFAULT '0',
  `replyNum` int(11) NOT NULL DEFAULT '0',
  `headURL` varchar(100) DEFAULT NULL,
  `check` int(11) DEFAULT '0' COMMENT '是否审核，0表示未审核，1表示审核',
  `status` int(11) DEFAULT '1' COMMENT '是否合法，0未通过，1通过',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

LOCK TABLES `comment` WRITE;

INSERT INTO `comment` (`id`, `nickname`, `email`, `content`, `cdate`, `likeNum`, `hateNum`, `parent`, `blogID`, `shareNum`, `replyNum`, `headURL`, `check`, `status`)
VALUES
	('0162f1f25337462a9897488c18f21e07','胡建洪','1043244432@qq.com','<a href=\"javascript:;\" class=\"qing-comment-aite\">@胡建洪</a> <img alt=\"[围观]\" title=\"[围观]\" src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/f2/wg_thumb.gif\"> ','2017-02-13 17:40:06',0,0,'14e0efeef2c1430faae70629982797ea','qingcailuobo-msg-cmt',0,0,'author.jpg',1,0),
	('0299eb279917427cbcc59db11e853899','胡建洪','1043244432@qq.com','<a href=\"javascript:;\" class=\"qing-comment-aite\">@羊皮卷网</a> 没问题啊','2017-06-08 15:03:47',0,0,'1194597f59974786862a06bb722f46d0','bd9567a036794a97bb6ada54a362b37d',0,0,'author.jpg',1,1),
	('04728bffe10d4af29b2b598ef28a49ea','笨小孩','1391936847@qq.com','博主莫急，知己在前路','2017-03-15 23:55:25',1,0,'','f4864b922fb1492e91a83e79d491fa3d',0,0,'16.gif',0,1),
	('0480ae6e03ab4ad4b606101203c5d92b','李大宝','1Q@qq.com','<a href=\"javascript:;\" class=\"qing-comment-aite\">@SillyBoy</a> test','2017-02-13 17:44:36',1,1,'','cb7fdf7d43924bd198d86fa6208db44b',0,0,'57.gif',1,1),
	('05df9a4e6d9c407dab31890545698163','胡建洪','1043244432@qq.com','<pre>.qing-comment-no {<br>	margin-top: 1rem;<br>    border: 1px solid #B0E0F9;<br>    height: 10rem;<br>    background: #f8f8f8;<br>    text-align: center;<br>}<br></pre>测试代码功能段','2017-02-11 14:25:46',0,0,'','qingcailuobo-msg-cmt',0,0,'36.gif',1,0),
	('0668e9b15d414d68a8744c7b1d546d39','123','1310228145@qq.com','sdsd','2017-02-08 15:21:38',1,0,NULL,'qingcailuobo-msg-cmt',0,0,'50.gif',1,1),
	('07019924e60441cdaa5de4c166c30a66','huahua','huadi916@gmail.com','咦，是呢！喜欢按键可以无限点。','2017-04-10 11:09:49',0,0,'','f4864b922fb1492e91a83e79d491fa3d',0,0,'70.gif',0,1),
	('099b1227eb734183a1c1e98e1012e43f','胡格子','1017877487@qq.com','博主，喜欢功能有bug，未登录可以无限点','2017-03-13 13:28:20',2,0,'','f4864b922fb1492e91a83e79d491fa3d',0,0,'65.gif',0,1),
	('09cd17dd2e084ba6952b9d50509aa94c','别人家的老公','gudankangti1987@126.com','方便发一份这个个人博客的mysql数据库给我吗？<br><br>gudankangti1987<a href=\"javascript:;\" class=\"qing-comment-aite\">@126.com</a>','2017-02-15 16:57:58',1,0,'','qingcailuobo-msg-cmt',0,0,'48.gif',1,1),
	('0ca1634dfcd84676947f80386541a3b4','123','123@qq.com','6666666!','2017-02-26 14:32:53',0,0,'','qingcailuobo-msg-cmt',0,0,'45.gif',1,1),
	('0e67948f38d04f99bade324c398774d1','胡建洪','1043244432@qq.com','<a href=\"javascript:;\" class=\"qing-comment-aite\">@keen</a> <img alt=\"[可爱]\" title=\"[可爱]\" src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/14/tza_thumb.gif\"> <img alt=\"[可爱]\" title=\"[可爱]\" src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/14/tza_thumb.gif\"> 谢谢啊','2017-02-16 09:42:35',1,0,'746ca5a04dce4d0fb33c456243886abc','qingcailuobo-msg-cmt',0,0,'author.jpg',1,1),
	('110bbe580c0a4c6fafd657c00a12de94','aa','zhouby@huanlvjinfu.com.cn','ds','2017-05-10 16:13:42',3,1,'','qingcailuobo-msg-cmt',0,0,'11.gif',0,1),
	('1186e465bb674164a0f9fffc2258bc1e','AA','aa@qq.com','AA','2017-03-07 17:05:07',1,0,'','f584b7d7774b437a87290a072dfb9a02',0,0,'15.gif',0,1),
	('1194597f59974786862a06bb722f46d0','羊皮卷网','v5pp@qq.com',' <a href=\"http://ypj5.com\" target=\"_blank\" rel=\"nofollow\">http://ypj5.com</a>  换链接吗？','2017-05-17 22:38:00',0,0,'','bd9567a036794a97bb6ada54a362b37d',0,0,'40.gif',0,1),
	('12b7abadba19408ca0f84b76e447da05','胡建洪','1043244432@qq.com','感谢胡同学于2017年02月09日赞助1.0元！','2017-02-09 13:48:15',9,1,NULL,'qingcailuo_donate_cmt',0,0,'author.jpg',1,1),
	('14e0efeef2c1430faae70629982797ea','胡建洪','1043244432@qq.com','ds<img alt=\"[亲亲]\" title=\"[亲亲]\" src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/8f/qq_thumb.gif\"> ','2017-02-13 17:36:44',0,0,'e96c604870a84768befe3fa6d63bdc8e','qingcailuobo-msg-cmt',0,0,'author.jpg',1,0),
	('1556e4bc958f45c9bd1daa6d8109d15e','胡建洪','1043244432@qq.com','@huige java','2017-02-10 14:35:09',0,0,'ad05798804b8489687dfe8d249170ffd','qingcailuobo-msg-cmt',0,0,'36.gif',1,1),
	('1a69ae4e50ad4d86b50b2c0c126a1fd3','CC','61562576@qq.com','第一次使用start这样来启动的，这个项目怎么部署在tomcat下？','2017-07-26 17:10:17',2,0,'','5a823d3753b945e98696a83fe779bf3b',0,0,'13.gif',0,1),
	('1be7c054f94f4ac7b893086a729ebdeb','asf','asf@163.com','<pre>sad<br></pre>','2017-09-23 17:43:47',1,0,'','qingcailuobo-msg-cmt',0,0,'67.gif',0,1),
	('1e3aebc056f14e53aa390a99caa955fe','7878','9002@qq.com','<a href=\"javascript:;\" class=\"qing-comment-aite\">@77</a> 777','2017-06-05 23:10:11',0,0,'e31df40e5b7543faa5d9d0789d168e71','f584b7d7774b437a87290a072dfb9a02',0,0,'62.gif',0,1),
	('224038e533164a7a9797d7713aa67fb8','ken','1069046590@qq.com','您好，我在添加文章时，显示的是静态化失败。请问怎么解决','2017-06-05 16:21:45',0,0,'','qingcailuobo-msg-cmt',0,0,'17.gif',0,1),
	('23c492ba08a34933aeeee5e9554e1799','从V型从','qweq@qq.com','22222','2017-04-24 17:42:52',1,2,'','qingcailuobo-msg-cmt',0,0,'65.gif',0,1),
	('2829d10c521944149e12e7e35f548498','落叶无声','1015966457@qq.com','<img alt=\"[偷笑]\" title=\"[偷笑]\" src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/19/heia_thumb.gif\"> 做的真不错','2017-06-20 22:55:49',7,0,'','qingcailuobo-msg-cmt',0,0,'73.gif',0,1),
	('296b76a8de5949e095eb56f784762c23','胡建洪','1043244432@qq.com','<a href=\"javascript:;\" class=\"qing-comment-aite\">@别人家的老公</a> 已经发送到您的邮箱了，其中有几张表是无用的！','2017-02-15 19:55:47',0,0,'09cd17dd2e084ba6952b9d50509aa94c','qingcailuobo-msg-cmt',0,0,'author.jpg',1,1),
	('2edb017060094360a86cc1ad357df660','胡建洪','1043244432@qq.com','<a href=\"javascript:;\" class=\"qing-comment-aite\">@别人家的老公</a> 好的，我待会儿发给你<img alt=\"[微笑]\" title=\"[微笑]\" src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/5c/huanglianwx_thumb.gif\"> ','2017-02-15 19:31:42',0,0,'09cd17dd2e084ba6952b9d50509aa94c','qingcailuobo-msg-cmt',0,0,'author.jpg',1,1),
	('31408bf668764385a00263ff64594c06','1=1&#39;','1@sh.sh','&lt;x&gt;&#39;1=1','2017-03-31 23:21:29',6,2,'','qingcailuobo-msg-cmt',0,0,'33.gif',0,1),
	('326c7a85fc824fafa6d170c3332aa202','你好','123asdf@163.com','不错','2017-02-16 21:31:52',1,1,'','qingcailuobo-msg-cmt',0,0,'21.gif',1,1),
	('353e8c0fcedf4e19bd053225bbf2d70c','a','b@123.com','<pre>#include &lt;stdio.h&gt;<br>int main(){<br>     a=1;<br><br>}<br></pre>','2017-03-05 15:20:51',0,0,'','359a42eec11c4fee9351a2891bf2afa9',0,0,'53.gif',1,1),
	('375aff6d177248ed93137d346634c642','朗若','104324432@qq.com','虽然没看懂，但是还是Mark一下！','2017-09-05 22:18:31',0,0,'','5fb856efa680421ea2290276dd37045e',0,0,'62.gif',0,1),
	('39a87206b36340329feb4ae711656fb7','木槿心','13770733135@163.com','博主加油，祝好运','2017-03-10 19:41:40',1,0,'','f4864b922fb1492e91a83e79d491fa3d',0,0,'31.gif',0,1),
	('3ab39d7e1e63411fae1d810c89ae493e','我牛','luojie@yydrobot.com','参观学习','2017-07-01 15:43:37',0,0,'','c088cee7075c4a70a8b87bf5ba0b3813',0,0,'55.gif',0,1),
	('3efbd06b6e0b434bac70def3338f4275','123','12312@qq.com','评论为什么这么慢？','2017-02-20 16:51:19',0,0,'','3ba1267bf2c245bf88c3fc66b2e09013',0,0,'70.gif',1,0),
	('4053f103aec145dab55c674e72ee5564','第三方','111@12.com','手上的撒大','2017-02-21 20:43:28',1,1,'','c088cee7075c4a70a8b87bf5ba0b3813',0,0,'57.gif',1,1),
	('41e28bd09f7147c2ac39b85068ee536a','饺子','941192051@qq.com','<img alt=\"[太开心]\" title=\"[太开心]\" src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/58/mb_thumb.gif\"> ','2017-03-24 15:57:45',0,2,'','qingcailuobo-msg-cmt',0,0,'9.gif',0,1),
	('4265ff3f3a4b48c8b0060d5bce7ea7ea','6666','66@6.com','<pre>&lt;h1&gt;6666666&lt;/h1&gt;<br></pre>','2017-05-10 21:01:52',0,0,'','bd9567a036794a97bb6ada54a362b37d',0,0,'23.gif',0,1),
	('43e302db33de46398e7966014519e6e4','不知道','11@123.com','今天生产资料不在，上网很不方便，只能来你这里玩玩了','2017-07-26 15:10:11',0,0,'','qingcailuobo-msg-cmt',0,0,'53.gif',0,1),
	('441aa4dd308643879e99d528b11459dc','2ysp','1123804727@qq.com','厉害啊，感觉我就做不出来','2017-07-20 16:44:46',0,0,'','qingcailuobo-msg-cmt',0,0,'50.gif',0,1),
	('44627966c0964883b26aa1056055240a','nihao','1310229149@qq.com','12dsadface[可怜] ','2017-02-08 15:34:21',0,0,NULL,'qingcailuobo-msg-cmt',0,0,'23.gif',1,1),
	('44680c2fc33d496e82bf12d756a56cf8','SillyBoy','1043244432@qq.com','<img alt=\"[右哼哼]\" title=\"[右哼哼]\" src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/98/yhh_thumb.gif\"> ','2017-02-13 11:12:35',0,0,'','qingcailuobo-msg-cmt',0,0,'author.jpg',1,1),
	('44a447607b59408c8f29062d4c13d5bc','seck','504038236@qq.com','怎么 后台 提交 文章 就出现“请求异常，请 重试”  求 博主 测试一下','2017-06-09 16:28:32',1,1,'','093dcae887cd4904b2d244fcdca5473a',0,0,'22.gif',0,1),
	('454e7a085c704b8e96672133420d2f7d','hujiang@163.com','hujiang@163.com','[pre]\npublic static void listFiles(File file){\n		if(file.isDirectory()){\n			File[] file2 = file.listFiles();\n			for(File file3 : file2){\n				if(file3.isDirectory()){\n					listFiles(file3);\n				} else {\n					String path = file3.getAbsolutePath();\n					upload(path, sub(path), token);\n				}\n			}\n		} else {\n			String path = file.getAbsolutePath();\n			upload(path, sub(path), token);\n		}\n	}\n[/pre]','2017-02-08 16:07:16',0,0,NULL,'495fa978801d418a9b6ed475c989eaa1',0,0,'47.gif',1,1),
	('479d618d3f8541cf814f7d54405091c9','huige','935178577@qq.com','你好你的后台是用java还是php?\n','2017-02-10 11:03:11',0,0,'','qingcailuobo-msg-cmt',0,0,'71.gif',1,1),
	('47e8e53da6db439ca9c54c23e05ee580','qwrqweq','wrqwrqwr@qq.com','<a href=\"javascript:;\" class=\"qing-comment-aite\">@，、，、，、；买了么，。吗</a> weqwe','2017-03-22 17:27:59',0,1,'bcb00802580d4f47aa41775d4cdca379','qingcailuobo-msg-cmt',0,0,'4.gif',0,1),
	('48060bce590242648c986484df74e83c','`','11@qq.com','dasd','2017-06-17 16:15:32',0,0,'','359a42eec11c4fee9351a2891bf2afa9',0,0,'5.gif',0,1),
	('482eee976d1f4891a01180d0b7d20055','SillyBoy','123435@163.com','不错，face[嘻嘻] ','2017-02-08 16:44:10',3,2,NULL,'cb7fdf7d43924bd198d86fa6208db44b',0,0,'41.gif',1,1),
	('4b3172c1184a4b6eb74d65290b8b84af','背影','1234@163.com','世界很大，人生很长','2017-04-24 15:57:19',1,1,'','qingcailuobo-msg-cmt',0,0,'47.gif',0,1),
	('4b4c5f066d37464ab6ef3eddd12f89ff','胡建洪','1043244432@qq.com','<a href=\"javascript:;\" class=\"qing-comment-aite\">@ken</a> 这个需要看下后台报什么错误了','2017-06-08 15:03:33',2,0,'224038e533164a7a9797d7713aa67fb8','qingcailuobo-msg-cmt',0,0,'author.jpg',1,1),
	('4b63da68f1d94d2886a8358c252955b1','Jiayang','Chen.Jiayang@foxmail.com','干货很多，网站吼吼看！！！','2017-08-29 16:38:20',1,0,'','qingcailuobo-msg-cmt',0,0,'18.gif',0,1),
	('4b89b41590164466964337c22935ab25','tt','y@shit.com','[pre]\ny y y y\n[/pre]','2017-02-10 02:14:08',0,0,'','qingcailuobo-msg-cmt',0,0,'16.gif',1,1),
	('4cbc999f61594e20b9b9633943712ea6','胡建洪','1043244432@qq.com','<a href=\"javascript:;\" class=\"qing-comment-aite\">@没有的别想了</a> 还行吧，谢谢支持啊<img alt=\"[微笑]\" title=\"[微笑]\" src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/5c/huanglianwx_thumb.gif\">','2017-02-19 09:29:19',1,1,'8b486897be9d49e5ae514cb170d46880','e045b65486664c67820ef9f7f4b81542',0,0,'author.jpg',1,1),
	('4d5a623462f24fa283e055965de3e86d','Jackylin','52686675@qq.com','我也用Jfinal 开发了一个 个人博客，发现jfinal不错，不过在前端渲染数据方面我用的vue.js<br>不知道你是如何做的<br>博客是否有源码研究研究<br><img alt=\"[微笑]\" title=\"[微笑]\" src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/5c/huanglianwx_thumb.gif\"> <br><br>还有表情选择有点样式问题~~~','2017-02-15 22:36:46',4,0,'','5a823d3753b945e98696a83fe779bf3b',0,0,'28.gif',1,1),
	('4e8d7ca972e746bca258cde884777d23','张航','zhanghang@qq.com','face[心] face[鼓掌] face[good] ','2017-02-09 21:11:41',0,0,'','9b07036e1c04405f997aafd301e32bf0',0,0,'23.gif',1,1),
	('5111391a9c2b4f9cb93c7dab0764e0ff','sampson','dkynjust@foxmail.com','不错，不错！','2017-02-20 18:37:08',0,0,'','5a823d3753b945e98696a83fe779bf3b',0,0,'21.gif',1,1),
	('54b68f56154c40718daecffd6c0c2125','aa','aa@a.com','<a href=\"javascript:;\" class=\"qing-comment-aite\">@AA</a> <a href=\"javascript:;\" class=\"qing-comment-aite\">@123</a> aaa','2017-03-07 17:07:28',0,0,'1186e465bb674164a0f9fffc2258bc1e','f584b7d7774b437a87290a072dfb9a02',0,0,'14.gif',0,1),
	('598031d1686d4cb59eadbbe8ffd984a0','123123','123123@qq.com','<pre>/**<br> * Copyright (c) 2015, 玛雅牛［李飞］ (lifei<a href=\"javascript:;\" class=\"qing-comment-aite\">@wellbole.com).</a><br> *<br> * Licensed under the Apache License, Version 2.0 (the &quot;License&quot;);<br> * you may not use this file except in compliance with the License.<br> * You may obtain a copy of the License at<br> *<br> *      http://www.apache.org/licenses/LICENSE-2.0<br> *<br> * Unless required by applicable law or agreed to in writing, software<br> * distributed under the License is distributed on an &quot;AS IS&quot; BASIS,<br> * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.<br> * See the License for the specific language governing permissions and<br> * limitations under the License.<br> */<br>package com.jfinal.plugin.scheduler;<br><br>import java.util.HashMap;<br>import java.util.Map;<br>import java.util.Set;<br>import java.util.concurrent.ScheduledFuture;<br>import java.util.concurrent.ScheduledThreadPoolExecutor;<br>import java.util.concurrent.TimeUnit;<br><br>import com.jfinal.kit.Prop;<br>import com.jfinal.kit.PropKit;<br>import com.jfinal.kit.StrKit;<br>import com.jfinal.log.Log;<br>import com.jfinal.plugin.IPlugin;<br><br>import it.sauronsoftware.cron4j.Scheduler;<br><br>/**<br> * <a href=\"javascript:;\" class=\"qing-comment-aite\">@ClassName:</a> SchedulerPlugin<br> * <a href=\"javascript:;\" class=\"qing-comment-aite\">@Description:</a> 简单任务调度插件，整合了cron4j和ScheduledThreadPoolExecutor<br> * <a href=\"javascript:;\" class=\"qing-comment-aite\">@author</a> 李飞 (lifei<a href=\"javascript:;\" class=\"qing-comment-aite\">@wellbole.com)</a><br> * <a href=\"javascript:;\" class=\"qing-comment-aite\">@date</a> 2015年8月1日 下午10:01:37<br> * <a href=\"javascript:;\" class=\"qing-comment-aite\">@since</a> V1.0.0<br> */<br>public class SchedulerPlugin implements IPlugin {<br><br>	private static Log LOG = Log.getLog(&quot;SchedulerPlugin&quot;);<br><br>	/**<br>	 * cron调度器<br>	 */<br>	private final Scheduler cronScheduler = new Scheduler();<br><br>	/**<br>	 * ScheduledThreadPoolExecutor调度器<br>	 */<br>	private final ScheduledThreadPoolExecutor taskScheduler;<br><br>	/**<br>	 * 调度任务配置文件<br>	 */<br>	private final String jobConfigFile;<br><br>	/**<br>	 * &lt;p&gt;<br>	 * Title: SchedulerPlugin<br>	 * &lt;/p&gt;<br>	 * &lt;p&gt;<br>	 * Description: 构造函数(线程池依据系统核心数自动设定)<br>	 * &lt;/p&gt;<br>	 * <br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@since</a> V1.0.0<br>	 */<br>	public SchedulerPlugin() {<br>		this(getBestPoolSize(), null);<br>	}<br><br>	/**<br>	 * &lt;p&gt;<br>	 * Title: SchedulerPlugin<br>	 * &lt;/p&gt;<br>	 * &lt;p&gt;<br>	 * Description: 构造函数(指定调度线程池大小)<br>	 * &lt;/p&gt;<br>	 * <br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@param</a> scheduledThreadPoolSize<br>	 *            调度线程池大小<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@since</a> V1.3.0<br>	 */<br>	public SchedulerPlugin(int scheduledThreadPoolSize) {<br>		this(scheduledThreadPoolSize, null);<br>	}<br><br>	/**<br>	 * &lt;p&gt;<br>	 * Title: SchedulerPlugin<br>	 * &lt;/p&gt;<br>	 * &lt;p&gt;<br>	 * Description: 构造函数(指定调度任务配置文件，线程池依据系统核心数自动设定)<br>	 * &lt;/p&gt;<br>	 * <br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@param</a> jobConfigFile<br>	 *            调度任务配置文件<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@since</a> V1.0.0<br>	 */<br>	public SchedulerPlugin(String jobConfigFile) {<br>		this(getBestPoolSize(), jobConfigFile);<br>	}<br><br>	/**<br>	 * &lt;p&gt;<br>	 * Title: SchedulerPlugin<br>	 * &lt;/p&gt;<br>	 * &lt;p&gt;<br>	 * Description: 构造函数(指定调度线程池大小和调度任务配置文件)<br>	 * &lt;/p&gt;<br>	 * <br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@param</a> scheduledThreadPoolSize<br>	 *            调度线程池大小<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@param</a> jobConfigFile<br>	 *            调度任务配置文件<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@since</a> V1.3.0<br>	 */<br>	public SchedulerPlugin(int scheduledThreadPoolSize, String jobConfigFile) {<br>		this.jobConfigFile = jobConfigFile;<br>		this.taskScheduler = new ScheduledThreadPoolExecutor(scheduledThreadPoolSize);<br>	}<br><br>	/**<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@Title:</a> cronSchedule<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@Description:</a> 添加基于Linux下的crontab表达式的调度任务(Runnable)<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@param</a> task<br>	 *            定期执行的任务(Runnable)<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@param</a> cronExpression<br>	 *            cron调度表达式<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@since</a> V1.0.0<br>	 */<br>	public void cronSchedule(Runnable task, String cronExpression) {<br>		this.cronScheduler.schedule(cronExpression, task);<br>	}<br><br>	/**<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@Title:</a> fixedRateSchedule<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@Description:</a> 立即启动，并以固定的频率来运行任务。后续任务的启动时间不受前次任务延时影响（并行）。<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@param</a> task<br>	 *            定期执行的任务<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@param</a> periodSeconds<br>	 *            每次执行任务的间隔时间(单位秒)<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@return</a><br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@since</a> V1.0.0<br>	 */<br>	public ScheduledFuture&lt;?&gt; fixedRateSchedule(Runnable task, int periodSeconds) {<br>		return taskScheduler.scheduleAtFixedRate(task, 0, periodSeconds, TimeUnit.SECONDS);<br>	}<br><br>	/**<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@Title:</a> fixedDelaySchedule<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@Description:</a> 立即启动，两次任务间保持固定的时间间隔(任务串行执行，前一个结束之后间隔固定时间后一个才会启动)<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@param</a> task<br>	 *            定期执行的任务<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@param</a> periodSeconds<br>	 *            每次执行任务的间隔时间(单位秒)<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@return</a><br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@since</a> V1.0.0<br>	 */<br>	public ScheduledFuture&lt;?&gt; fixedDelaySchedule(Runnable task, int periodSeconds) {<br>		return taskScheduler.scheduleWithFixedDelay(task, 0, periodSeconds, TimeUnit.SECONDS);<br>	}<br><br>	<a href=\"javascript:;\" class=\"qing-comment-aite\">@Override</a><br>	public boolean start() {<br>		if (this.jobConfigFile != null) {<br>			// 任务配置文件非空,从配置文件汇总加载任务<br>			loadJobsFromConfigFile();<br>		}<br>		this.cronScheduler.setDaemon(true);<br>		this.cronScheduler.start();<br>		LOG.info(&quot;SchedulerPlugin is started&quot;);<br>		return true;<br>	}<br><br>	<a href=\"javascript:;\" class=\"qing-comment-aite\">@Override</a><br>	public boolean stop() {<br>		this.cronScheduler.stop();<br>		this.taskScheduler.shutdown();<br>		LOG.info(&quot;SchedulerPlugin is stopped&quot;);<br>		return true;<br>	}<br><br>	/**<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@Title:</a> loadJobsFromConfigFile<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@Description:</a> 从配置文件汇总加载任务<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@since</a> V1.0.0<br>	 */<br>	private void loadJobsFromConfigFile() {<br>		// 获取job配置文件<br>		Prop jobProp = PropKit.use(this.jobConfigFile);<br>		// 获得所有任务名<br>		Set&lt;String&gt; jobNames = this.getJobNamesFromProp(jobProp);<br>		// 逐个加载任务<br>		for (String jobName : jobNames) {<br>			loadJob(jobProp, jobName);<br>		}<br>	}<br><br>	/**<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@Title:</a> loadJob<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@Description:</a> 加载一个任务<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@param</a> jobProp<br>	 *            job配置<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@param</a> jobName<br>	 *            job名<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@since</a> V1.0.0<br>	 */<br>	private void loadJob(Prop jobProp, String jobName) {<br>		// 任务开关，默认开启<br>		Boolean enable = jobProp.getBoolean(jobName + &quot;.enable&quot;, Boolean.TRUE);<br>		// 任务被禁用，直接返回<br>		if (!enable) {<br>			return;<br>		}<br>		// 创建要执行的任务<br>		Runnable task = createTask(jobName, jobProp.get(jobName + &quot;.class&quot;));<br>		// 任务类型<br>		String taskType = jobProp.get(jobName + &quot;.type&quot;);<br>		if (StrKit.isBlank(taskType)) {<br>			throw new RuntimeException(&quot;Please set &quot; + jobName + &quot;.type&quot;);<br>		}<br>		// 任务表达式<br>		String expr = jobProp.get(jobName + &quot;.expr&quot;);<br>		if (StrKit.isBlank(expr)) {<br>			throw new RuntimeException(&quot;Please set &quot; + jobName + &quot;.expr&quot;);<br>		}<br>		// 依据任务类型，开始调度任务<br>		scheduleJobByType(jobName, taskType, expr, task);<br>		LOG.info(&quot;--------load job: &quot; + jobName + &quot; successfully--------&quot;);<br>		LOG.info(&quot;class: &quot; + jobProp.get(jobName + &quot;.class&quot;));<br>		LOG.info(&quot;type : &quot; + taskType);<br>		LOG.info(&quot;expr : &quot; + expr);<br>		LOG.info(&quot;----------------&quot;);<br>	}<br><br>	/**<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@Title:</a> scheduleJobByType<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@Description:</a> 依据任务类型，开始调度任务<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@param</a> jobName<br>	 *            任务名<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@param</a> taskType<br>	 *            任务类型<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@param</a> expr<br>	 *            调度表达式<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@param</a> task<br>	 *            执行的任务<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@since</a> V1.0.0<br>	 */<br>	private void scheduleJobByType(String jobName, String taskType, String expr, Runnable task) {<br>		if (&quot;cron&quot;.equals(taskType)) {<br>			this.cronSchedule(task, expr);<br>		} else if (&quot;fixedRate&quot;.equals(taskType)) {<br>			int periodSeconds = 0;<br>			try {<br>				periodSeconds = Integer.parseInt(expr);<br>			} catch (NumberFormatException e) {<br>				throw new RuntimeException(jobName + &quot;.expr must be a number&quot;);<br>			}<br>			this.fixedRateSchedule(task, periodSeconds);<br>		} else if (&quot;fixedDelay&quot;.equals(taskType)) {<br>			int periodSeconds = 0;<br>			try {<br>				periodSeconds = Integer.parseInt(expr);<br>			} catch (NumberFormatException e) {<br>				throw new RuntimeException(jobName + &quot;.expr must be a number&quot;);<br>			}<br>			this.fixedDelaySchedule(task, periodSeconds);<br>		} else {<br>			throw new RuntimeException(&quot;Please set &quot; + jobName + &quot;.type to cron/fixedRate/fixedDelay&quot;);<br>		}<br>	}<br><br>	/**<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@Title:</a> createTask<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@Description:</a> 创建任务<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@param</a> jobName<br>	 *            任务名<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@param</a> taskClassName<br>	 *            任务类名<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@return</a> Runnable对象<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@since</a> V1.0.0<br>	 */<br>	private Runnable createTask(String jobName, String taskClassName) {<br>		if (taskClassName == null) {<br>			throw new RuntimeException(&quot;Please set &quot; + jobName + &quot;.className&quot;);<br>		}<br><br>		Object temp = null;<br>		try {<br>			temp = Class.forName(taskClassName).newInstance();<br>		} catch (Exception e) {<br>			throw new RuntimeException(&quot;Can not create instance of class: &quot; + taskClassName, e);<br>		}<br><br>		Runnable task = null;<br>		if (temp instanceof Runnable) {<br>			task = (Runnable) temp;<br>		} else {<br>			throw new RuntimeException(&quot;Can not create instance of class: &quot; + taskClassName<br>					+ &quot;. this class must implements Runnable interface&quot;);<br>		}<br>		return task;<br>	}<br><br>	/**<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@Title:</a> getJobNamesFromProp<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@Description:</a> 获得所有任务名<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@param</a> jobProp<br>	 *            job配置<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@return</a> 任务名集合<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@since</a> V1.0.0<br>	 */<br>	private Set&lt;String&gt; getJobNamesFromProp(Prop jobProp) {<br>		Map&lt;String, Boolean&gt; jobNames = new HashMap&lt;String, Boolean&gt;();<br>		for (Object item : jobProp.getProperties().keySet()) {<br>			String fullKeyName = item.toString();<br>			// 获得job名<br>			String jobName = fullKeyName.substring(0, fullKeyName.indexOf(&quot;.&quot;));<br>			jobNames.put(jobName, Boolean.TRUE);<br>		}<br>		return jobNames.keySet();<br>	}<br><br>	/**<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@Title:</a> getBestPoolSize<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@Description:</a> 获得调度线程池大小<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@return</a><br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@since</a> V1.0.0<br>	 */<br>	private static int getBestPoolSize() {<br>		try {<br>			final int cores = Runtime.getRuntime().availableProcessors();<br>			// 每个核有8个调度线程<br>			return cores * 8;<br>		} catch (Throwable e) {<br>			return 8;<br>		}<br>	}<br>}<br></pre>','2017-02-20 16:51:50',0,0,'','3ba1267bf2c245bf88c3fc66b2e09013',0,0,'3.gif',1,0),
	('59abadca059742b8bf621000621c2d81','嘻嘻嘻','543532@qq.com','<img alt=\"[嘻嘻]\" title=\"[嘻嘻]\" src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/0b/tootha_thumb.gif\"> ','2017-06-20 16:25:12',0,0,'','5a823d3753b945e98696a83fe779bf3b',0,0,'61.gif',0,1),
	('5eb03f2a125b40dab4eb62e48805c57d','水水','123@123.com','<a href=\"javascript:;\" class=\"qing-comment-aite\">@一个小白</a> 功能更强，界面更好看，但是要熟悉IDEA','2017-02-22 15:27:09',0,0,'ac7800241e1b47e586ec3ae0cfecc2b8','093dcae887cd4904b2d244fcdca5473a',0,0,'49.gif',1,1),
	('61e001a2937c4e439f61c971ebc10b64','胡建洪','1043244432@qq.com','&lt;script&gt;alert(&#39;test&#39;);&lt;/script&gt;','2017-02-11 14:03:42',1,0,'','qingcailuobo-msg-cmt',0,0,'36.gif',1,1),
	('6572089d2f314dd182a744e028f3aa1b','sjyw','14241924@qq.com','666','2017-05-13 06:24:40',0,0,'','qingcailuobo-msg-cmt',0,0,'38.gif',0,1),
	('6633c29f8c8b421da6683136ab4489c7','什么东东','1281715978@qq.com','厉害了','2017-03-17 09:51:38',1,1,'','f4864b922fb1492e91a83e79d491fa3d',0,0,'26.gif',0,1),
	('6b9e681cbbe145abbe30ed6cd26ad846','654','654@qq.com','666','2017-08-17 12:39:42',0,0,'','3ddd409dfc9344449dac3717ecc75f72',0,0,'56.gif',0,1),
	('6ee6cfe290084c6191ff71c45abb6e47','好几个','w@163.com','我终于抢到沙发了，哈哈','2017-02-09 13:01:42',1,2,NULL,'1ca3888bf494480a81db9f577e362d07',0,0,'16.gif',1,1),
	('7236bd2e38e443c5adb7bca77d0d8ce5','羊皮卷网','374949633@qq.com',' 我的网站也是jfinal做得，交换连接不？<a href=\"http://ypj5.com\" target=\"_blank\" rel=\"nofollow\">http://ypj5.com</a> ','2017-05-12 20:05:05',0,0,'','qingcailuobo-msg-cmt',0,0,'49.gif',0,1),
	('7352ee4845164cb894d9eefb4bc9f12e','黎明','1111@qq.com','<a href=\"javascript:;\" class=\"qing-comment-aite\">@胡建洪</a> 博主这是成功防止脚本攻击了吗face[哈哈] ','2017-02-11 14:05:05',1,0,'a4c5ba7c3a204091947ac196dc0f8df1','qingcailuobo-msg-cmt',0,0,'29.gif',1,1),
	('74517bf2067a4f9a9c01153bbcced1a0','test','test@qq.com','face[睡] ','2017-02-06 13:44:29',0,1,NULL,'qingcailuobo-msg-cmt',0,0,'25.gif',1,1),
	('746ca5a04dce4d0fb33c456243886abc','keen','liukehenu@163.com','不错，支持下<img alt=\"[嘻嘻]\" title=\"[嘻嘻]\" src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/0b/tootha_thumb.gif\"> ','2017-02-16 09:21:07',0,0,'','qingcailuobo-msg-cmt',0,0,'5.gif',1,1),
	('76d61f333e114b2099c563d448335ce6','大大','32156@qq.com','<img alt=\"[微笑]\" title=\"[微笑]\" src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/5c/huanglianwx_thumb.gif\"> ','2017-03-14 16:16:06',1,1,'','qingcailuobo-msg-cmt',0,0,'14.gif',0,1),
	('7bcbf387f7634870838a0d121b2768bb','小木鱼','547857825@qq.com','这个留言墙怎么做的？是无限级的回复吗','2017-07-07 10:02:11',0,0,'','qingcailuobo-msg-cmt',0,0,'16.gif',0,1),
	('7e10601e12454c67bcac754b6069f023','11','11@q.com','按时送达·','2017-05-30 16:28:42',0,0,'','e045b65486664c67820ef9f7f4b81542',0,0,'64.gif',0,1),
	('7e9a7a91fc0c4e6985d2044edf6208b8','黎明','1043244432@qq.com','<a href=\"javascript:;\" class=\"qing-comment-aite\">@胡建洪</a> 伤心<img alt=\"[泪]\" title=\"[泪]\" src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/9d/sada_thumb.gif\"> ','2017-02-11 14:14:04',0,0,'e5aa2f373a4d4dada06aad0772127a0d','qingcailuobo-msg-cmt',0,0,'36.gif',1,1),
	('7fafe13b6887459f9ceea59ac0119612','yjiang','yj@163.com','我的人都有','2017-03-03 12:07:03',2,0,'','e045b65486664c67820ef9f7f4b81542',0,0,'52.gif',1,1),
	('81cef627f7c041e790f772faf3462048','一问大师','2252538638@qq.com','<img alt=\"[心]\" title=\"[心]\" src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/hearta_thumb.gif\"> <img alt=\"[心]\" title=\"[心]\" src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/hearta_thumb.gif\"> ','2017-06-26 17:35:47',0,0,'','qingcailuobo-msg-cmt',0,0,'25.gif',0,1),
	('857b271c066a4fef817db06237407db4','ceshi','351402@qq.com','<pre>&lt;html&gt;<br>&lt;br&gt;<br>&lt;div&gt;<br>&lt;/div&gt;<br>&lt;/html&gt;<br></pre>','2017-03-05 22:24:24',0,0,'','qingcailuobo-msg-cmt',0,0,'36.gif',1,0),
	('85bc5d39155b4690b70a3c580a55cf13','补码','11@123.com','已知补码怎么求值','2017-07-26 15:31:04',1,1,'','qingcailuobo-msg-cmt',0,0,'53.gif',0,1),
	('8b486897be9d49e5ae514cb170d46880','没有的别想了','heichumei@sina.com','从jfinal社区过来的,楼主写得不错啊','2017-02-18 22:46:56',0,0,'','e045b65486664c67820ef9f7f4b81542',0,0,'19.gif',1,1),
	('8ce45bcf86c64924b9569d550d8ca5dd','dssss','ss@qq.com','sss','2017-02-23 17:35:59',0,1,'','qingcailuobo-msg-cmt',0,0,'3.gif',1,1),
	('8e439f6115214c8497b7047085235e8e','胡建洪','1043244432@qq.com','感谢萧碧无痕于2017年07月20日热心赞助10元','2017-07-20 10:26:09',4,0,NULL,'qingcailuo_donate_cmt',0,0,'author.jpg',1,1),
	('9189e9329408447aa7a794ec66c6a535','胡建洪','1043244432@qq.com','<a href=\"javascript:;\" class=\"qing-comment-aite\">@douma</a> 晚上我初步写个文档吧<img alt=\"[微笑]\" title=\"[微笑]\" src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/5c/huanglianwx_thumb.gif\"> ','2017-02-21 15:29:38',1,0,'f2fb3aef7d124db1b14079864902fab4','5a823d3753b945e98696a83fe779bf3b',0,0,'author.jpg',1,1),
	('92e4d4fa47f148f19f67cd4db9319844','胡建洪','1043244432@qq.com','<a href=\"javascript:;\" class=\"qing-comment-aite\">@绝尘</a> 好的，谢谢啊，晚上修改下','2017-02-27 13:35:20',3,2,'fc7d48959c10498b8af2097b6eee9b25','qingcailuobo-msg-cmt',0,0,'author.jpg',1,1),
	('92f488e19429428483037f04f28d4a9b','ceshi','351402@qq.com','<pre>&lt;html&gt;<br>&lt;br&gt;<br>&lt;div&gt;<br>&lt;/div&gt;<br>&lt;/html&gt;<br></pre>','2017-03-05 22:24:26',0,0,'','qingcailuobo-msg-cmt',0,0,'36.gif',1,0),
	('943f867fa5764a368923c4079e232c25','555','5555@qq.com','777777','2017-02-17 17:18:40',1,0,'','5a823d3753b945e98696a83fe779bf3b',0,0,'67.gif',1,1),
	('9508ed9173a94e629f23a38b3e6ad6d0','StruggleYang','172455319@qq.com','喜欢有bug，可以无限点','2017-03-14 14:24:07',2,1,'','f4864b922fb1492e91a83e79d491fa3d',0,0,'54.gif',0,1),
	('99fb24ffdc6b4fd797e3f71ba0be3e16','123123123','123123@qq.com','<pre>/**<br> * Copyright (c) 2015, 玛雅牛［李飞］ (lifei<a href=\"javascript:;\" class=\"qing-comment-aite\">@wellbole.com).</a><br> *<br> * Licensed under the Apache License, Version 2.0 (the &quot;License&quot;);<br> * you may not use this file except in compliance with the License.<br> * You may obtain a copy of the License at<br> *<br> *      http://www.apache.org/licenses/LICENSE-2.0<br> *<br> * Unless required by applicable law or agreed to in writing, software<br> * distributed under the License is distributed on an &quot;AS IS&quot; BASIS,<br> * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.<br> * See the License for the specific language governing permissions and<br> * limitations under the License.<br> */<br>package com.jfinal.plugin.scheduler;<br><br>import java.util.HashMap;<br>import java.util.Map;<br>import java.util.Set;<br>import java.util.concurrent.ScheduledFuture;<br>import java.util.concurrent.ScheduledThreadPoolExecutor;<br>import java.util.concurrent.TimeUnit;<br><br>import com.jfinal.kit.Prop;<br>import com.jfinal.kit.PropKit;<br>import com.jfinal.kit.StrKit;<br>import com.jfinal.log.Log;<br>import com.jfinal.plugin.IPlugin;<br><br>import it.sauronsoftware.cron4j.Scheduler;<br><br>/**<br> * <a href=\"javascript:;\" class=\"qing-comment-aite\">@ClassName:</a> SchedulerPlugin<br> * <a href=\"javascript:;\" class=\"qing-comment-aite\">@Description:</a> 简单任务调度插件，整合了cron4j和ScheduledThreadPoolExecutor<br> * <a href=\"javascript:;\" class=\"qing-comment-aite\">@author</a> 李飞 (lifei<a href=\"javascript:;\" class=\"qing-comment-aite\">@wellbole.com)</a><br> * <a href=\"javascript:;\" class=\"qing-comment-aite\">@date</a> 2015年8月1日 下午10:01:37<br> * <a href=\"javascript:;\" class=\"qing-comment-aite\">@since</a> V1.0.0<br> */<br>public class SchedulerPlugin implements IPlugin {<br><br>	private static Log LOG = Log.getLog(&quot;SchedulerPlugin&quot;);<br><br>	/**<br>	 * cron调度器<br>	 */<br>	private final Scheduler cronScheduler = new Scheduler();<br><br>	/**<br>	 * ScheduledThreadPoolExecutor调度器<br>	 */<br>	private final ScheduledThreadPoolExecutor taskScheduler;<br><br>	/**<br>	 * 调度任务配置文件<br>	 */<br>	private final String jobConfigFile;<br><br>	/**<br>	 * &lt;p&gt;<br>	 * Title: SchedulerPlugin<br>	 * &lt;/p&gt;<br>	 * &lt;p&gt;<br>	 * Description: 构造函数(线程池依据系统核心数自动设定)<br>	 * &lt;/p&gt;<br>	 * <br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@since</a> V1.0.0<br>	 */<br>	public SchedulerPlugin() {<br>		this(getBestPoolSize(), null);<br>	}<br><br>	/**<br>	 * &lt;p&gt;<br>	 * Title: SchedulerPlugin<br>	 * &lt;/p&gt;<br>	 * &lt;p&gt;<br>	 * Description: 构造函数(指定调度线程池大小)<br>	 * &lt;/p&gt;<br>	 * <br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@param</a> scheduledThreadPoolSize<br>	 *            调度线程池大小<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@since</a> V1.3.0<br>	 */<br>	public SchedulerPlugin(int scheduledThreadPoolSize) {<br>		this(scheduledThreadPoolSize, null);<br>	}<br><br>	/**<br>	 * &lt;p&gt;<br>	 * Title: SchedulerPlugin<br>	 * &lt;/p&gt;<br>	 * &lt;p&gt;<br>	 * Description: 构造函数(指定调度任务配置文件，线程池依据系统核心数自动设定)<br>	 * &lt;/p&gt;<br>	 * <br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@param</a> jobConfigFile<br>	 *            调度任务配置文件<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@since</a> V1.0.0<br>	 */<br>	public SchedulerPlugin(String jobConfigFile) {<br>		this(getBestPoolSize(), jobConfigFile);<br>	}<br><br>	/**<br>	 * &lt;p&gt;<br>	 * Title: SchedulerPlugin<br>	 * &lt;/p&gt;<br>	 * &lt;p&gt;<br>	 * Description: 构造函数(指定调度线程池大小和调度任务配置文件)<br>	 * &lt;/p&gt;<br>	 * <br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@param</a> scheduledThreadPoolSize<br>	 *            调度线程池大小<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@param</a> jobConfigFile<br>	 *            调度任务配置文件<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@since</a> V1.3.0<br>	 */<br>	public SchedulerPlugin(int scheduledThreadPoolSize, String jobConfigFile) {<br>		this.jobConfigFile = jobConfigFile;<br>		this.taskScheduler = new ScheduledThreadPoolExecutor(scheduledThreadPoolSize);<br>	}<br><br>	/**<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@Title:</a> cronSchedule<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@Description:</a> 添加基于Linux下的crontab表达式的调度任务(Runnable)<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@param</a> task<br>	 *            定期执行的任务(Runnable)<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@param</a> cronExpression<br>	 *            cron调度表达式<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@since</a> V1.0.0<br>	 */<br>	public void cronSchedule(Runnable task, String cronExpression) {<br>		this.cronScheduler.schedule(cronExpression, task);<br>	}<br><br>	/**<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@Title:</a> fixedRateSchedule<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@Description:</a> 立即启动，并以固定的频率来运行任务。后续任务的启动时间不受前次任务延时影响（并行）。<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@param</a> task<br>	 *            定期执行的任务<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@param</a> periodSeconds<br>	 *            每次执行任务的间隔时间(单位秒)<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@return</a><br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@since</a> V1.0.0<br>	 */<br>	public ScheduledFuture&lt;?&gt; fixedRateSchedule(Runnable task, int periodSeconds) {<br>		return taskScheduler.scheduleAtFixedRate(task, 0, periodSeconds, TimeUnit.SECONDS);<br>	}<br><br>	/**<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@Title:</a> fixedDelaySchedule<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@Description:</a> 立即启动，两次任务间保持固定的时间间隔(任务串行执行，前一个结束之后间隔固定时间后一个才会启动)<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@param</a> task<br>	 *            定期执行的任务<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@param</a> periodSeconds<br>	 *            每次执行任务的间隔时间(单位秒)<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@return</a><br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@since</a> V1.0.0<br>	 */<br>	public ScheduledFuture&lt;?&gt; fixedDelaySchedule(Runnable task, int periodSeconds) {<br>		return taskScheduler.scheduleWithFixedDelay(task, 0, periodSeconds, TimeUnit.SECONDS);<br>	}<br><br>	<a href=\"javascript:;\" class=\"qing-comment-aite\">@Override</a><br>	public boolean start() {<br>		if (this.jobConfigFile != null) {<br>			// 任务配置文件非空,从配置文件汇总加载任务<br>			loadJobsFromConfigFile();<br>		}<br>		this.cronScheduler.setDaemon(true);<br>		this.cronScheduler.start();<br>		LOG.info(&quot;SchedulerPlugin is started&quot;);<br>		return true;<br>	}<br><br>	<a href=\"javascript:;\" class=\"qing-comment-aite\">@Override</a><br>	public boolean stop() {<br>		this.cronScheduler.stop();<br>		this.taskScheduler.shutdown();<br>		LOG.info(&quot;SchedulerPlugin is stopped&quot;);<br>		return true;<br>	}<br><br>	/**<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@Title:</a> loadJobsFromConfigFile<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@Description:</a> 从配置文件汇总加载任务<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@since</a> V1.0.0<br>	 */<br>	private void loadJobsFromConfigFile() {<br>		// 获取job配置文件<br>		Prop jobProp = PropKit.use(this.jobConfigFile);<br>		// 获得所有任务名<br>		Set&lt;String&gt; jobNames = this.getJobNamesFromProp(jobProp);<br>		// 逐个加载任务<br>		for (String jobName : jobNames) {<br>			loadJob(jobProp, jobName);<br>		}<br>	}<br><br>	/**<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@Title:</a> loadJob<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@Description:</a> 加载一个任务<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@param</a> jobProp<br>	 *            job配置<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@param</a> jobName<br>	 *            job名<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@since</a> V1.0.0<br>	 */<br>	private void loadJob(Prop jobProp, String jobName) {<br>		// 任务开关，默认开启<br>		Boolean enable = jobProp.getBoolean(jobName + &quot;.enable&quot;, Boolean.TRUE);<br>		// 任务被禁用，直接返回<br>		if (!enable) {<br>			return;<br>		}<br>		// 创建要执行的任务<br>		Runnable task = createTask(jobName, jobProp.get(jobName + &quot;.class&quot;));<br>		// 任务类型<br>		String taskType = jobProp.get(jobName + &quot;.type&quot;);<br>		if (StrKit.isBlank(taskType)) {<br>			throw new RuntimeException(&quot;Please set &quot; + jobName + &quot;.type&quot;);<br>		}<br>		// 任务表达式<br>		String expr = jobProp.get(jobName + &quot;.expr&quot;);<br>		if (StrKit.isBlank(expr)) {<br>			throw new RuntimeException(&quot;Please set &quot; + jobName + &quot;.expr&quot;);<br>		}<br>		// 依据任务类型，开始调度任务<br>		scheduleJobByType(jobName, taskType, expr, task);<br>		LOG.info(&quot;--------load job: &quot; + jobName + &quot; successfully--------&quot;);<br>		LOG.info(&quot;class: &quot; + jobProp.get(jobName + &quot;.class&quot;));<br>		LOG.info(&quot;type : &quot; + taskType);<br>		LOG.info(&quot;expr : &quot; + expr);<br>		LOG.info(&quot;----------------&quot;);<br>	}<br><br>	/**<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@Title:</a> scheduleJobByType<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@Description:</a> 依据任务类型，开始调度任务<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@param</a> jobName<br>	 *            任务名<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@param</a> taskType<br>	 *            任务类型<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@param</a> expr<br>	 *            调度表达式<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@param</a> task<br>	 *            执行的任务<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@since</a> V1.0.0<br>	 */<br>	private void scheduleJobByType(String jobName, String taskType, String expr, Runnable task) {<br>		if (&quot;cron&quot;.equals(taskType)) {<br>			this.cronSchedule(task, expr);<br>		} else if (&quot;fixedRate&quot;.equals(taskType)) {<br>			int periodSeconds = 0;<br>			try {<br>				periodSeconds = Integer.parseInt(expr);<br>			} catch (NumberFormatException e) {<br>				throw new RuntimeException(jobName + &quot;.expr must be a number&quot;);<br>			}<br>			this.fixedRateSchedule(task, periodSeconds);<br>		} else if (&quot;fixedDelay&quot;.equals(taskType)) {<br>			int periodSeconds = 0;<br>			try {<br>				periodSeconds = Integer.parseInt(expr);<br>			} catch (NumberFormatException e) {<br>				throw new RuntimeException(jobName + &quot;.expr must be a number&quot;);<br>			}<br>			this.fixedDelaySchedule(task, periodSeconds);<br>		} else {<br>			throw new RuntimeException(&quot;Please set &quot; + jobName + &quot;.type to cron/fixedRate/fixedDelay&quot;);<br>		}<br>	}<br><br>	/**<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@Title:</a> createTask<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@Description:</a> 创建任务<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@param</a> jobName<br>	 *            任务名<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@param</a> taskClassName<br>	 *            任务类名<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@return</a> Runnable对象<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@since</a> V1.0.0<br>	 */<br>	private Runnable createTask(String jobName, String taskClassName) {<br>		if (taskClassName == null) {<br>			throw new RuntimeException(&quot;Please set &quot; + jobName + &quot;.className&quot;);<br>		}<br><br>		Object temp = null;<br>		try {<br>			temp = Class.forName(taskClassName).newInstance();<br>		} catch (Exception e) {<br>			throw new RuntimeException(&quot;Can not create instance of class: &quot; + taskClassName, e);<br>		}<br><br>		Runnable task = null;<br>		if (temp instanceof Runnable) {<br>			task = (Runnable) temp;<br>		} else {<br>			throw new RuntimeException(&quot;Can not create instance of class: &quot; + taskClassName<br>					+ &quot;. this class must implements Runnable interface&quot;);<br>		}<br>		return task;<br>	}<br><br>	/**<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@Title:</a> getJobNamesFromProp<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@Description:</a> 获得所有任务名<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@param</a> jobProp<br>	 *            job配置<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@return</a> 任务名集合<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@since</a> V1.0.0<br>	 */<br>	private Set&lt;String&gt; getJobNamesFromProp(Prop jobProp) {<br>		Map&lt;String, Boolean&gt; jobNames = new HashMap&lt;String, Boolean&gt;();<br>		for (Object item : jobProp.getProperties().keySet()) {<br>			String fullKeyName = item.toString();<br>			// 获得job名<br>			String jobName = fullKeyName.substring(0, fullKeyName.indexOf(&quot;.&quot;));<br>			jobNames.put(jobName, Boolean.TRUE);<br>		}<br>		return jobNames.keySet();<br>	}<br><br>	/**<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@Title:</a> getBestPoolSize<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@Description:</a> 获得调度线程池大小<br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@return</a><br>	 * <a href=\"javascript:;\" class=\"qing-comment-aite\">@since</a> V1.0.0<br>	 */<br>	private static int getBestPoolSize() {<br>		try {<br>			final int cores = Runtime.getRuntime().availableProcessors();<br>			// 每个核有8个调度线程<br>			return cores * 8;<br>		} catch (Throwable e) {<br>			return 8;<br>		}<br>	}<br>}<br></pre>','2017-02-20 16:50:17',0,0,'','3ba1267bf2c245bf88c3fc66b2e09013',0,0,'3.gif',1,0),
	('9b6ee242b96a4ba5913d95addc326d51','而威尔','111111@127.com','而威尔','2017-07-19 16:40:59',0,0,'','qingcailuobo-msg-cmt',0,0,'73.gif',0,1),
	('9edcd024fc5f4bdcb33ab43a0b778875','ssss','sss@qq.com','[pre]\nsssdasdfgas\n[/pre]','2017-02-08 16:05:50',0,0,NULL,'495fa978801d418a9b6ed475c989eaa1',0,0,'66.gif',1,1),
	('9f2c258cbe044fc180a8f1acd53da663','胡建洪','1043244432@qq.com','<a href=\"javascript:;\" class=\"qing-comment-aite\">@一个小白</a> 这个不清楚啊，我没有使用过！<img alt=\"[泪]\" title=\"[泪]\" src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/9d/sada_thumb.gif\"> ','2017-02-22 14:22:39',0,0,'ac7800241e1b47e586ec3ae0cfecc2b8','093dcae887cd4904b2d244fcdca5473a',0,0,'author.jpg',1,1),
	('a06dac7b331b4b3480ab8d2e102c829a','a','a@qq.com','a','2017-06-29 16:54:17',0,0,'','qingcailuobo-msg-cmt',0,0,'12.gif',0,1),
	('a15cfde1817b4672b38026e2a30ba355','12','1310228148@qq.com','121face[可爱] face[嘻嘻] ','2017-02-08 15:15:05',1,0,NULL,'qingcailuobo-msg-cmt',0,0,'57.gif',1,1),
	('a25e91262e6943e78b51d94afc785648','旋风','163@qq.com','@好几个 厉害啊，我只能下次再抢了','2017-02-09 13:17:42',0,0,NULL,'1ca3888bf494480a81db9f577e362d07',0,0,'3.gif',1,1),
	('a30afae08ac34ff8b62a3ec82f01a888','别人家的老公','gudankangti1987@126.com','<a href=\"javascript:;\" class=\"qing-comment-aite\">@胡建洪</a>  之前一直做的springmvc ，听到同事说起这个框架就想来看看   谢谢','2017-02-16 10:37:04',1,1,'296b76a8de5949e095eb56f784762c23','qingcailuobo-msg-cmt',0,0,'48.gif',1,1),
	('a498b67702274cb8b82bfb647caedf30','tty','123@123.com','face[哈哈] face[哈哈] face[哈哈] ','2017-02-11 14:06:21',0,0,'','qingcailuobo-msg-cmt',0,0,'49.gif',1,1),
	('a51dd86bf1204a07bc1edc0f31a28c19','gg','941192051@qq.com','禁吸戒毒家<img alt=\"[睡]\" title=\"[睡]\" src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/96/huangliansj_thumb.gif\"> f f f','2017-04-26 10:35:02',1,1,'','qingcailuobo-msg-cmt',0,0,'9.gif',0,1),
	('a7cb4e90982343e482e507d6a91ac52d','sdfa','fdas@qq.com','dfsafa','2017-02-07 22:14:16',0,0,NULL,'qingcailuobo-msg-cmt',0,0,'71.gif',1,1),
	('ac7800241e1b47e586ec3ae0cfecc2b8','一个小白','492300924@qq.com','intellij idea 开发软件跟MyEclipse 有什么不一样啊','2017-02-22 11:40:55',1,1,'','093dcae887cd4904b2d244fcdca5473a',0,0,'42.gif',1,1),
	('b20a30ea1a674ca79bf89d5af6552022','aaa','12132132132@qq.com','<a href=\"javascript:;\" class=\"qing-comment-aite\">@qwrqweq</a> ','2017-05-22 17:34:48',1,1,'47e8e53da6db439ca9c54c23e05ee580','qingcailuobo-msg-cmt',0,0,'0.gif',0,1),
	('b33a7340b7a04cd599876a100f109fa5','习大大','renji235@139.com','<a href=\"javascript:;\" class=\"qing-comment-aite\">@gg</a> <img alt=\"[哈哈]\" title=\"[哈哈]\" src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/6a/laugh.gif\"> ','2017-07-26 17:05:41',1,1,'a51dd86bf1204a07bc1edc0f31a28c19','qingcailuobo-msg-cmt',0,0,'18.gif',0,1),
	('b54232b8632b4f02b65146de0007b6fd','append','qew@qq.com','不错不错','2017-02-21 11:06:52',1,1,'','qingcailuobo-msg-cmt',0,0,'48.gif',1,1),
	('b57b14869b9b4df59158ddc30dfd9084','胡建洪','1043244432@qq.com','<a href=\"javascript:;\" class=\"qing-comment-aite\">@1</a> 目前就这样搞的，反正用户量不大<img alt=\"[微笑]\" title=\"[微笑]\" src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/5c/huanglianwx_thumb.gif\"> ','2017-05-10 09:44:24',0,0,'c9a0e029dbe54a198bd24b5aa0f26759','e045b65486664c67820ef9f7f4b81542',0,0,'author.jpg',1,1),
	('b5dcb4440fd44de09b29466a5469726a','ceshi','351402@qq.com','<pre>&lt;html&gt;<br>&lt;br&gt;<br>&lt;div&gt;<br>&lt;/div&gt;<br>&lt;/html&gt;<br></pre>','2017-03-05 22:24:23',0,0,'','qingcailuobo-msg-cmt',0,0,'36.gif',1,1),
	('b626acde292e499d886bb20bb5fc0361','胡建洪','1043244432@qq.com','<a href=\"javascript:;\" class=\"qing-comment-aite\">@sampson</a> 谢谢支持啊！<img alt=\"[微笑]\" title=\"[微笑]\" src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/5c/huanglianwx_thumb.gif\"> ','2017-02-20 20:59:15',0,1,'5111391a9c2b4f9cb93c7dab0764e0ff','5a823d3753b945e98696a83fe779bf3b',0,0,'author.jpg',1,1),
	('b68f4bec8487450bab0b7f9465660565','kinano','1032467389@qq.com','very good','2017-05-02 17:09:41',0,0,'','5a823d3753b945e98696a83fe779bf3b',0,0,'62.gif',0,1),
	('b7d7efe4069847589ec6d0aea26e7101','dsa','123@q.com','vzds','2017-09-24 20:00:42',0,0,'','qingcailuobo-msg-cmt',0,0,'6.gif',0,1),
	('b8f813e23c5b4f6699aff2cae7cbe3ef','ceshi','351402@qq.com','<pre>&lt;html&gt;<br>&lt;br&gt;<br>&lt;div&gt;<br>&lt;/div&gt;<br>&lt;/html&gt;<br></pre>','2017-03-05 22:24:23',0,0,'','qingcailuobo-msg-cmt',0,0,'36.gif',1,0),
	('b934e82937f943ac8adf56ac26335895','huige','935178577@qq.com','你好你的后台是用java还是php?\n','2017-02-10 11:03:11',0,0,'','qingcailuobo-msg-cmt',0,0,'71.gif',1,1),
	('ba0f9d9ff2f34916916d27e68487d01e','这个是什么','123123@qq.com','阿三发射点','2017-02-11 23:22:58',0,0,'','qingcailuobo-msg-cmt',0,0,'3.gif',1,1),
	('bad8b0b68f674bd9aaa00c4ec176a834','小伟','12313@qq.com','马斯克：人类的生存模式已经是编写好的程序 网友的评论炸了！<br>原创 SandT 2017-04-15 09:45<br>马斯克：人类的生存模式已经是编写好的程序 网友的评论炸了！<br> <a href=\"http://p9.pstatp.com/large/1b8700037d6a074957b3\" target=\"_blank\" rel=\"nofollow\">http://p9.pstatp.com/large/1b8700037d6a074957b3</a> <br>SpaceX太空探索技术公司、环保电动汽车公司特斯拉（Tesla）以及SolarCity四家公司的CEO马斯克表示：“我们只有十亿分之一的机会生活在现实世界中。”实际上这意味着，他认为我们更有可能生活在复杂的计算机模拟世界中。我们的生存，我们的人生，我们的喜怒哀乐都被设定的好好的。<br><br>马斯克：人类的生存模式已经是编写好的程序 网友的评论炸了！<br><br>那么，我们的人生都是救世机器程序中预设的代码，我们所遭遇到的一切都是因为命运敲定了要这么发生。 那么像我们的首富马云，王健林的人生程序员是不是做了手脚，我们先看看媒体如何介绍马云的出生：1964年9月，马云出生在杭州一户普通人家。小脑袋，小身子，即使是40年后，他的“光辉形象”仍然没有什么大的改观。美国《福布斯》记者对马云的描述是这样的：“深凹的面颊，扭曲的头发，淘气的露齿笑，一个5英尺高、100磅重的顽童模样”。这就是马云出生的小号，如今可以说是世界家喻户晓的人物。<br><br>马斯克：人类的生存模式已经是编写好的程序 网友的评论炸了！<br><br>如果人生正如马斯克说的，已经被设定好了，那么网友们的评论都炸了，纷纷表示了自己的不满。','2017-05-12 17:48:36',0,0,'','qingcailuobo-msg-cmt',0,0,'5.gif',0,1),
	('bb7775ecb64b48b6b3af250548a51734','111','111@123.com','112face[哈哈] ','2017-02-10 01:04:44',1,0,'','qingcailuobo-msg-cmt',0,0,'44.gif',1,1),
	('bcb00802580d4f47aa41775d4cdca379','，、，、，、；买了么，。吗','ads@sd.com','gjbjnkj','2017-03-07 07:27:05',0,1,'','qingcailuobo-msg-cmt',0,0,'26.gif',1,1),
	('bcf916dbd0644953a604e445e225a7a1','555','5555@qq.com','<a href=\"javascript:;\" class=\"qing-comment-aite\">@SillyBoy</a> 11111','2017-02-14 18:24:26',0,0,'44680c2fc33d496e82bf12d756a56cf8','qingcailuobo-msg-cmt',0,0,'67.gif',1,1),
	('c8b9dea9bce745b2870ef38e6e31d7cf','test','test@qq.com','我终于成功抢到沙发啦','2017-02-06 13:09:51',1,0,NULL,'6a34999f2c79496ebd7c0aa921fdd53a',0,0,'25.gif',1,1),
	('c9a0e029dbe54a198bd24b5aa0f26759','1','1@1.com','<a href=\"javascript:;\" class=\"qing-comment-aite\">@胡建洪</a> 不登录就能留言?','2017-05-05 13:32:34',0,0,'4cbc999f61594e20b9b9633943712ea6','e045b65486664c67820ef9f7f4b81542',0,0,'27.gif',0,1),
	('caac442feb054b34ba76a7f34ec8db28','flyed@126.com','flyed@126.com','<img alt=\"[微笑]\" title=\"[微笑]\" src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/5c/huanglianwx_thumb.gif\"> ','2017-02-17 17:04:12',4,0,'','qingcailuobo-msg-cmt',0,0,'32.gif',1,1),
	('cc5f1233d7564976bfdde4b4deb4f04c','胡建洪','1043244432@qq.com','感谢丁*蓉同学于2017年02月08日赞助1.0元！','2017-02-09 13:45:23',9,2,NULL,'qingcailuo_donate_cmt',0,0,'author.jpg',1,1),
	('cedc71b2c1c3439aa2b2004b33ad584b','阿萨','1011111@qq.com','<a href=\"javascript:;\" class=\"qing-comment-aite\">@asddsad@qq.com</a>  你是谁','2017-06-20 23:03:06',0,0,'e82e608fc9c54bcebd2d1d9b899adab4','qingcailuobo-msg-cmt',0,0,'41.gif',0,1),
	('d2cceb5cd184436483b62a8301671e44','胡建洪','1043244432@qq.com','<a href=\"javascript:;\" class=\"qing-comment-aite\">@绝尘</a> 目前还没有做cookie处理，所以就这样啦，后面有时间在捣鼓下<img alt=\"[害羞]\" title=\"[害羞]\" src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/6e/shamea_thumb.gif\"> ','2017-02-27 13:34:15',1,0,'d3362eff475c45518fa33eca0d5f7571','qingcailuobo-msg-cmt',0,0,'author.jpg',1,1),
	('d3362eff475c45518fa33eca0d5f7571','绝尘','237809796@qq.com','可以无限点赞，还有无限踩，jfinal+layui 组合不错','2017-02-27 12:28:51',6,0,'','qingcailuobo-msg-cmt',0,0,'58.gif',1,1),
	('d424e40c14244ffaa72b00e8f6c33d4d','胡建洪','1043244432@qq.com','感谢章*（星缘）同学于2017年3月25日热心赞助5元～','2017-03-25 22:17:27',9,5,NULL,'qingcailuo_donate_cmt',0,0,'author.jpg',1,1),
	('d50999bf8b984132ac2db857f082c716','胡建洪','1043244432@qq.com','<a href=\"javascript:;\" class=\"qing-comment-aite\">@Tyrone</a> 这个得看下后台报什么错误了','2017-06-08 15:03:11',0,0,'eddd1141db40491b88ec2727971e1775','093dcae887cd4904b2d244fcdca5473a',0,0,'author.jpg',1,1),
	('d538576a33b74dfdb99ad35c9d247c9f','胡建洪','1043244432@qq.com','感谢崔大大于2017年02月10日赞助1.0元！','2017-02-10 19:17:07',11,2,NULL,'qingcailuo_donate_cmt',0,0,'author.jpg',1,1),
	('d6af603c25584a6a936cf7d8f68eed6a','ceshi','351402@qq.com','<pre>&lt;html&gt;<br>&lt;br&gt;<br>&lt;div&gt;<br>&lt;/div&gt;<br>&lt;/html&gt;<br></pre>','2017-03-05 22:24:23',0,0,'','qingcailuobo-msg-cmt',0,0,'36.gif',1,0),
	('d7a3b7572a4741c491055b89365bda20','rr','rr23buliuhu@163.com','rr','2017-05-17 17:39:02',0,0,'','e045b65486664c67820ef9f7f4b81542',0,0,'26.gif',0,1),
	('d8f9cc4ea0d140bcb8a20bb1446fb38b','Jackylin ','1@1.com','撒','2017-04-16 21:18:21',0,0,'','5a823d3753b945e98696a83fe779bf3b',0,0,'27.gif',0,1),
	('db7b3bb79f5449cfa600860bc98c01d9','哈哈','941192051@qq.com','快哭了','2017-04-10 15:30:18',1,3,'','qingcailuobo-msg-cmt',0,0,'9.gif',0,1),
	('deaefa1b83ab41df80021235a4ffc80f','sathya','sathya@163.com','<img alt=\"[微笑]\" title=\"[微笑]\" src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/5c/huanglianwx_thumb.gif\"> ','2017-05-31 16:07:50',0,0,'','qingcailuobo-msg-cmt',0,0,'59.gif',0,1),
	('e1421adb67c949ebb61e7ccdb8c9b4e3','dfr','123@123.com','<img alt=\"[可爱]\" title=\"[可爱]\" src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/14/tza_thumb.gif\"> <img alt=\"[可爱]\" title=\"[可爱]\" src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/14/tza_thumb.gif\"> <img alt=\"[可爱]\" title=\"[可爱]\" src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/14/tza_thumb.gif\"> ','2017-02-11 14:31:44',0,0,'','qingcailuobo-msg-cmt',0,0,'49.gif',1,1),
	('e1dbcc4ebca14be6a843b25833e0be65','发过火','941192051@qq.com','fgvasdga','2017-03-24 11:43:47',0,1,'','qingcailuobo-msg-cmt',0,0,'9.gif',0,1),
	('e31df40e5b7543faa5d9d0789d168e71','77','888@334.com','777','2017-06-05 23:09:31',0,0,'','f584b7d7774b437a87290a072dfb9a02',0,0,'55.gif',0,1),
	('e3847bd50a8f4f3cbdad0856e48b7790','董克源','dokeyuan@163.com','@胡建洪 face[互粉] [pre]\nvar laytpl = layui.laytpl;\nvar laypage = layui.laypage;\nvar qingcmt = layui.qingcmt;\n[/pre]','2017-02-09 21:09:43',0,0,'446482318567456daa6990233bca0e19','9b07036e1c04405f997aafd301e32bf0',0,0,'27.gif',1,1),
	('e5aa2f373a4d4dada06aad0772127a0d','胡建洪','1043244432@qq.com','<a href=\"javascript:;\" class=\"qing-comment-aite\">@黎明</a> 是的啊，但是以前的表情等又解析失败了','2017-02-11 14:13:08',0,0,'7352ee4845164cb894d9eefb4bc9f12e','qingcailuobo-msg-cmt',0,0,'36.gif',1,1),
	('e76a2e0c1d1c43cdaa97788100c51529','ceshi','351402@qq.com','<pre>&lt;html&gt;<br>&lt;br&gt;<br>&lt;div&gt;<br>&lt;/div&gt;<br>&lt;/html&gt;<br></pre>','2017-03-05 22:24:23',0,0,'','qingcailuobo-msg-cmt',0,0,'36.gif',1,0),
	('e79338284da54d22808099a4b1b07176','aa','aa@123.com','var path = require(&#39;path&#39;)<br><br>var gulp = require(&#39;gulp&#39;)<br>var gutil = require(&#39;gulp-util&#39;)<br>var jsonlint = require(&#39;gulp-jsonlint&#39;)<br>var eslint = require(&#39;gulp-eslint&#39;)<br>var EslintCLIEngine = require(&#39;eslint&#39;).CLIEngine<br>var webpack = require(&#39;webpack&#39;)<br>var webpackConfig = require(&#39;./webpack.config&#39;).webpack<br>var webpackStatusConfig = require(&#39;./res/common/status/webpack.config&#39;)<br>var gettext = require(&#39;gulp-angular-gettext&#39;)<br>var pug = require(&#39;gulp-pug&#39;)<br>var del = require(&#39;del&#39;)<br>// var protractor = require(&#39;gulp-protractor&#39;)<br>var protractor = require(&#39;./res/test/e2e/helpers/gulp-protractor-adv&#39;)<br>var protractorConfig = &#39;./res/test/protractor.conf&#39;<br>var karma = require(&#39;karma&#39;).server<br>var karmaConfig = &#39;/res/test/karma.conf.js&#39;<br>var stream = require(&#39;stream&#39;)<br>var run = require(&#39;gulp-run&#39;)<br><br>gulp.task(&#39;jsonlint&#39;, function() {<br>  return gulp.src([<br>      &#39;.bowerrc&#39;<br>    , &#39;.yo-rc.json&#39;<br>    , &#39;*.json&#39;<br>    ])<br>    .pipe(jsonlint())<br>    .pipe(jsonlint.reporter())<br>})<br><br>// Try to use eslint-cli directly instead of eslint-gulp<br>// since it doesn&#39;t support cache yet<br>gulp.task(&#39;eslint&#39;, function() {<br>  return gulp.src([<br>      &#39;lib/**/*.js&#39;<br>    , &#39;res/**/*.js&#39;<br>    , &#39;!res/bower_components/**&#39;<br>    , &#39;*.js&#39;<br>  ])<br>    // eslint() attaches the lint output to the &quot;eslint&quot; property<br>    // of the file object so it can be used by other modules.<br>    .pipe(eslint())<br>    // eslint.format() outputs the lint results to the console.<br>    // Alternatively use eslint.formatEach() (see Docs).<br>    .pipe(eslint.format())<br>    // To have the process exit with an error code (1) on<br>    // lint error, return the stream and pipe to failAfterError last.<br>    .pipe(eslint.failAfterError())<br>})<br><br>gulp.task(&#39;eslint-cli&#39;, function(done) {<br>  var cli = new EslintCLIEngine({<br>    cache: true<br>  , fix: false<br>  })<br><br>  var report = cli.executeOnFiles([<br>    &#39;lib/**/*.js&#39;<br>    , &#39;res/app/**/*.js&#39;<br>    , &#39;res/auth/**/*.js&#39;<br>    , &#39;res/common/**/*.js&#39;<br>    , &#39;res/test/**/*.js&#39;<br>    , &#39;res/web_modules/**/*.js&#39;<br>    , &#39;*.js&#39;<br>  ])<br>  var formatter = cli.getFormatter()<br>  console.log(formatter(report.results))<br><br>  if (report.errorCount &gt; 0) {<br>    done(new gutil.PluginError(&#39;eslint-cli&#39;, new Error(&#39;ESLint error&#39;)))<br>  }<br>  else {<br>    done()<br>  }<br>})<br><br><br>gulp.task(&#39;lint&#39;, [&#39;jsonlint&#39;, &#39;eslint-cli&#39;])<br>gulp.task(&#39;test&#39;, [&#39;lint&#39;, &#39;run:checkversion&#39;])<br>gulp.task(&#39;build&#39;, [&#39;clean&#39;, &#39;webpack:build&#39;])<br><br>gulp.task(&#39;run:checkversion&#39;, function() {<br>  gutil.log(&#39;Checking STF version...&#39;)<br>  return run(&#39;./bin/stf -V&#39;).exec()<br>})<br><br>gulp.task(&#39;karma_ci&#39;, function(done) {<br>  karma.start({<br>    configFile: path.join(__dirname, karmaConfig)<br>  , singleRun: true<br>  }, done)<br>})<br><br>gulp.task(&#39;karma&#39;, function(done) {<br>  karma.start({<br>    configFile: path.join(__dirname, karmaConfig)<br>  }, done)<br>})<br><br>if (gutil.env.multi) {<br>  protractorConfig = &#39;./res/test/protractor-multi.conf&#39;<br>}<br>else if (gutil.env.appium) {<br>  protractorConfig = &#39;./res/test/protractor-appium.conf&#39;<br>}<br><br>gulp.task(&#39;webdriver-update&#39;, protractor.webdriverUpdate)<br>gulp.task(&#39;webdriver-standalone&#39;, protractor.webdriverStandalone)<br>gulp.task(&#39;protractor-explorer&#39;, function(callback) {<br>  protractor.protractorExplorer({<br>    url: require(protractorConfig).config.baseUrl<br>  }, callback)<br>})<br><br>gulp.task(&#39;protractor&#39;, [&#39;webdriver-update&#39;], function(callback) {<br>  gulp.src([&#39;./res/test/e2e/**/*.js&#39;])<br>    .pipe(protractor.protractor({<br>      configFile: protractorConfig<br>    , debug: gutil.env.debug<br>    , suite: gutil.env.suite<br>    }))<br>    .on(&#39;error&#39;, function(e) {<br>      console.log(e)<br><br>      /* eslint no-console: 0 */<br>    })<br>    .on(&#39;end&#39;, callback)<br>})<br><br>// For piping strings<br>function fromString(filename, string) {<br>  var src = new stream.Readable({objectMode: true})<br>  src._read = function() {<br>    this.push(new gutil.File({<br>      cwd: &#39;&#39;<br>    , base: &#39;&#39;<br>    , path: filename<br>    , contents: new Buffer(string)<br>    }))<br>    this.push(null)<br>  }<br>  return src<br>}<br><br><br>// For production<br>gulp.task(&#39;webpack:build&#39;, function(callback) {<br>  var myConfig = Object.create(webpackConfig)<br>  myConfig.plugins = myConfig.plugins.concat(<br>    new webpack.DefinePlugin({<br>      &#39;process.env&#39;: {<br>        NODE_ENV: JSON.stringify(&#39;production&#39;)<br>      }<br>    })<br>  )<br>  myConfig.devtool = false<br><br>  webpack(myConfig, function(err, stats) {<br>    if (err) {<br>      throw new gutil.PluginError(&#39;webpack:build&#39;, err)<br>    }<br><br>    gutil.log(&#39;[webpack:build]&#39;, stats.toString({<br>      colors: true<br>    }))<br><br>    // Save stats to a json file<br>    // Can be analyzed in http://webpack.github.io/analyse/<br>    fromString(&#39;stats.json&#39;, JSON.stringify(stats.toJson()))<br>      .pipe(gulp.dest(&#39;./tmp/&#39;))<br><br>    callback()<br>  })<br>})<br><br>gulp.task(&#39;webpack:others&#39;, function(callback) {<br>  var myConfig = Object.create(webpackStatusConfig)<br>  myConfig.plugins = myConfig.plugins.concat(<br>    new webpack.DefinePlugin({<br>      &#39;process.env&#39;: {<br>        NODE_ENV: JSON.stringify(&#39;production&#39;)<br>      }<br>    })<br>  )<br>  myConfig.devtool = false<br><br>  webpack(myConfig, function(err, stats) {<br>    if (err) {<br>      throw new gutil.PluginError(&#39;webpack:others&#39;, err)<br>    }<br><br>    gutil.log(&#39;[webpack:others]&#39;, stats.toString({<br>      colors: true<br>    }))<br>    callback()<br>  })<br>})<br><br>gulp.task(&#39;translate&#39;, [<br>  &#39;translate:extract&#39;<br>, &#39;translate:push&#39;<br>, &#39;translate:pull&#39;<br>, &#39;translate:compile&#39;<br>])<br><br>gulp.task(&#39;pug&#39;, function() {<br>  return gulp.src([<br>      &#39;./res/**/*.pug&#39;<br>    , &#39;!./res/bower_components/**&#39;<br>    ])<br>    .pipe(pug({<br>      locals: {<br>        // So res/views/docs.pug doesn&#39;t complain<br>        markdownFile: {<br>          parseContent: function() {<br>          }<br>        }<br>      }<br>    }))<br>    .pipe(gulp.dest(&#39;./tmp/html/&#39;))<br>})<br><br>gulp.task(&#39;translate:extract&#39;, [&#39;pug&#39;], function() {<br>  return gulp.src([<br>      &#39;./tmp/html/**/*.html&#39;<br>    , &#39;./res/**/*.js&#39;<br>    , &#39;!./res/bower_components/**&#39;<br>    , &#39;!./res/build/**&#39;<br>    ])<br>    .pipe(gettext.extract(&#39;stf.pot&#39;))<br>    .pipe(gulp.dest(&#39;./res/common/lang/po/&#39;))<br>})<br><br>gulp.task(&#39;translate:compile&#39;, function() {<br>  return gulp.src(&#39;./res/common/lang/po/**/*.po&#39;)<br>    .pipe(gettext.compile({<br>      format: &#39;json&#39;<br>    }))<br>    .pipe(gulp.dest(&#39;./res/common/lang/translations/&#39;))<br>})<br><br>gulp.task(&#39;translate:push&#39;, function() {<br>  gutil.log(&#39;Pushing translation source to Transifex...&#39;)<br>  return run(&#39;tx push -s&#39;).exec()<br>})<br><br>gulp.task(&#39;translate:pull&#39;, function() {<br>  gutil.log(&#39;Pulling translations from Transifex...&#39;)<br>  return run(&#39;tx pull&#39;).exec()<br>})<br><br>gulp.task(&#39;clean&#39;, function(cb) {<br>  del([<br>    &#39;./tmp&#39;<br>    , &#39;./res/build&#39;<br>    , &#39;.eslintcache&#39;<br>  ], cb)<br>})','2017-07-28 14:57:12',0,0,'','qingcailuobo-msg-cmt',0,0,'43.gif',1,0),
	('e80b2c20bc55467cab40293503779b73','木槿心','13770733135@163.com','膜拜一下，我的胡哥','2017-07-26 09:15:05',0,0,'','00e05640cb9a4cef9ec0c355b4c4cd8c',0,0,'31.gif',0,1),
	('e82e608fc9c54bcebd2d1d9b899adab4','asddsad@qq.com','asddsad@qq.com','<a href=\"javascript:;\" class=\"qing-comment-aite\">@aaa</a> asdsadasdsadsad','2017-05-28 16:24:05',5,0,'b20a30ea1a674ca79bf89d5af6552022','qingcailuobo-msg-cmt',0,0,'73.gif',0,1),
	('e84f89d634e84eff8fe9cef3447827c4','dw','dqwd@qdqwd.com','dddd','2017-08-30 09:56:14',0,0,'','3ba1267bf2c245bf88c3fc66b2e09013',0,0,'70.gif',0,1),
	('e9f801f54bac4605b4d243f52c629148','123','123@qq.com','123','2017-03-02 17:58:38',1,1,'','f584b7d7774b437a87290a072dfb9a02',0,0,'45.gif',1,1),
	('ed33464693ba4493afd61a3ceb62f61c','胡建洪','1043244432@qq.com','<a href=\"javascript:;\" class=\"qing-comment-aite\">@小木鱼</a> 是的啊','2017-07-19 11:36:06',1,0,'7bcbf387f7634870838a0d121b2768bb','qingcailuobo-msg-cmt',0,0,'author.jpg',1,1),
	('ed912a7b0d894175a2aa2e828b5bc49d','aaa','aa@aa.com','aaa','2017-03-07 23:35:02',0,0,'','5a823d3753b945e98696a83fe779bf3b',0,0,'35.gif',0,1),
	('eddd1141db40491b88ec2727971e1775','Tyrone','li532788@126.com','配置文件:<br>#博文静态化存储的根目录<br>STATICS_ROOT_PATH = H:/Jfinal/qingcai-front<br><br>然后访问首页，出现以下错误，然后就404<br><pre>四月 18, 2017 4:01:07 下午 org.apache.jasper.servlet.JspServlet serviceJspFile<br>严重: PWC6117: File &quot;H%3A%5CWorkspaces%5CLunaEclipseWorkspaces%5Cluobo%5CWebRoot%5Cindex.jsp&quot; not found<br></pre>这个怎么解决呢？','2017-04-18 16:03:04',1,0,'','093dcae887cd4904b2d244fcdca5473a',0,0,'58.gif',0,1),
	('eebcaa3e41114e72b7efa65eb0867018','木槿','472998043@qq.com','估计是故意的吧<img alt=\"[嘻嘻]\" title=\"[嘻嘻]\" src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/0b/tootha_thumb.gif\"> <img alt=\"[嘻嘻]\" title=\"[嘻嘻]\" src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/0b/tootha_thumb.gif\"> <img alt=\"[嘻嘻]\" title=\"[嘻嘻]\" src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/0b/tootha_thumb.gif\"> ','2017-03-29 16:19:20',0,0,'','f4864b922fb1492e91a83e79d491fa3d',0,0,'29.gif',0,1),
	('f198101567b0453f8ebbc93f36404439','ceshi','351402@qq.com','<pre>&lt;html&gt;<br>&lt;br&gt;<br>&lt;div&gt;<br>&lt;/div&gt;<br>&lt;/html&gt;<br></pre>','2017-03-05 22:24:24',0,0,'','qingcailuobo-msg-cmt',0,0,'36.gif',1,0),
	('f2d850f24964441b989182795a580c74','胡建洪','1043244432@qq.com','<a href=\"javascript:;\" class=\"qing-comment-aite\">@Jackylin</a>  有的，我的源码放在 <a href=\"https://github.com/hujianhong/blog\" target=\"_blank\" rel=\"nofollow\">https://github.com/hujianhong/blog</a> 这里的。我选的前端框架有AmazeUI和layUI，前者实现跨屏适配，支持手机端浏览；后者主要实现数据渲染，模块开发嘛<img alt=\"[微笑]\" title=\"[微笑]\" src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/5c/huanglianwx_thumb.gif\"> 。是的，评论框的表情选择样式有点问题，谢谢指正啊<img alt=\"[可爱]\" title=\"[可爱]\" src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/14/tza_thumb.gif\"> ','2017-02-16 00:31:58',0,0,'4d5a623462f24fa283e055965de3e86d','5a823d3753b945e98696a83fe779bf3b',0,0,'author.jpg',1,1),
	('f2e026d9ff43489c91076fa583864957','666','y@y-cc.cc','学习了','2017-02-22 18:59:05',5,0,'','qingcailuobo-msg-cmt',0,0,'39.gif',1,1),
	('f2fb3aef7d124db1b14079864902fab4','douma','mrhe_vip@163.com','作者大大，你在文中写到：“我借助Nginx服务器实现连接前端和后端，实现前后端通信”  具体怎么做呢 说说思路嘛  我也想弄一个个人博客','2017-02-21 15:09:46',1,1,'','5a823d3753b945e98696a83fe779bf3b',0,0,'65.gif',1,1),
	('f4fba80972f647bbb55bb9c090c61085','ceshi','351402@qq.com','<pre>&lt;html&gt;<br>&lt;br&gt;<br>&lt;div&gt;<br>&lt;/div&gt;<br>&lt;/html&gt;<br></pre>','2017-03-05 22:24:24',0,0,'','qingcailuobo-msg-cmt',0,0,'36.gif',1,0),
	('f504203fe1dc4a239e39be262b0bd7f2','胡建洪','1043244432@qq.com','感谢孙*成同学于2017年02月27日热心赞助1.0元','2017-02-27 15:48:00',6,2,NULL,'qingcailuo_donate_cmt',0,0,'author.jpg',1,1),
	('f649aef366a647e08f440070f01b98a0','sd','234579@qq.com','sgs','2017-09-18 23:04:55',0,0,'','qingcailuobo-msg-cmt',0,0,'71.gif',0,1),
	('fa28c665f9404c2cabea1641e295a147','123','123@q.com','<img alt=\"[睡]\" title=\"[睡]\" src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/96/huangliansj_thumb.gif\"> ','2017-02-15 14:39:50',1,0,'','qingcailuobo-msg-cmt',0,0,'6.gif',1,1),
	('fc7d48959c10498b8af2097b6eee9b25','绝尘','237809796@qq.com','保存完后数据可以直接使用 异步加载免除刷新闪烁，（直接js将评论加入列表中）','2017-02-27 12:30:13',0,1,'','qingcailuobo-msg-cmt',0,0,'58.gif',1,1),
	('ff1f8747beb14e0db0218b4044e075c2','6666','6666@qq.com','<a href=\"javascript:;\" class=\"qing-comment-aite\">@什么东东</a> ','2017-04-11 22:28:12',0,0,'6633c29f8c8b421da6683136ab4489c7','f4864b922fb1492e91a83e79d491fa3d',0,0,'1.gif',0,1);

UNLOCK TABLES;



CREATE TABLE `notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` mediumtext NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0,不可见，1可见',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `notice` WRITE;

INSERT INTO `notice` (`id`, `content`, `start`, `end`, `visible`)
VALUES
	(1,'本博客系统已经开源在GitHub(https://github.com/hujianhong/blog)上了,需要的童鞋可以去下载玩玩～','2017-03-10 00:00:00','2017-12-31 00:00:00',1);

UNLOCK TABLES;



CREATE TABLE `tags` (
  `id` char(32) NOT NULL,
  `name` varchar(50) NOT NULL,
  `cdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `tags` WRITE;

INSERT INTO `tags` (`id`, `name`, `cdate`)
VALUES
	('046A899EE7A6EC88D370211A518C9E80','算法','2017-02-07 12:00:00'),
	('0796F7F8B93AD1204D4769C52AFF5284','队列','2017-02-20 21:37:21'),
	('0A5A4153B8FAB8B735400132F35570CD','前序','2017-02-18 21:26:44'),
	('0FEA7C47D93DA5689F31820EE525B367','数据结构','2017-02-07 12:00:00'),
	('1','数据挖掘','2017-02-07 12:00:00'),
	('1573C74E227F14DED2DAA71BB049ECDA','面试','2017-03-10 19:32:13'),
	('190980C7D0218074702264D8DA6E31E1','域名','2017-02-07 12:00:00'),
	('21D68B2DE0E91DFB14942CA8AEA316FC','思考','2017-09-22 23:29:13'),
	('235D7BE86290BD05B9985C8A5B3713FD','CCF','2017-02-07 12:00:00'),
	('267595728BEB6EE41DFC9C862917055D','本地运行','2017-02-21 20:43:20'),
	('2E25C285356CBB0ED8785A1377027D79','MAC','2017-04-12 09:16:46'),
	('32981A13284DB7A021131DF49E6CD203','js','2017-02-07 12:00:00'),
	('32F7222026696F30787889194DEE83E5','Eclipse','2017-02-21 20:43:20'),
	('36b487f38d114b10ae793ff58cf952fb','Net','2017-02-07 12:00:00'),
	('3FF3C3E26A68112C11C3E80F2A26896E','开发','2017-02-07 12:00:00'),
	('46CFF7C2E22C5FB804C02D5B561B39F8','JDK','2017-02-18 21:29:36'),
	('48B26E4419603D55F8128747CFEE5E92','求职','2017-09-11 14:55:50'),
	('49EDAB1CB53BA3CF77C6C3271196ACBB','阿里巴巴','2017-03-10 19:32:13'),
	('5','Java','2017-02-07 12:00:00'),
	('50c61d9e506248ae8ad00539a8603ea6','PHP','2017-02-07 12:00:00'),
	('558D23A4DCECDFDBE69B2C8BB50560A9','树高','2017-02-18 21:26:44'),
	('58463BDA2FB934A0ABC9E9A02C012A41','栈','2017-02-20 21:37:21'),
	('5A85E5CECB477D06AD59A113A1F6AE2C','LevelDB','2017-09-05 22:20:19'),
	('5BC06F5800D415CC95E1349EDBACA425','JS','2017-09-05 22:15:29'),
	('5CA2AA845C8CD5ACE6B016841F100D82','da','2017-09-24 19:51:36'),
	('5FC71C1AEC7C1753FA3596E8DDAD3C4C','JRE','2017-02-14 21:03:46'),
	('6','Android','2017-02-07 12:00:00'),
	('61FE750FD3C6240A6CD016C70E693D06','Java.JDK','2017-02-14 21:03:46'),
	('62A004B95946BB97541AFA471DCCA73A','MySQL','2017-02-20 21:30:57'),
	('62E0B5B350C9E3D2C19AA801D9442BA9','Nginx','2017-02-07 12:00:00'),
	('63DB5605AC2D3A21F0ABD506C9531209','图','2017-02-14 16:41:48'),
	('6499CC2E7CB3DAAF2861D054ECF54B87','最小生成树','2017-02-14 16:44:02'),
	('66C260D88C897E6C6353F6DB6EACC3BD','分区','2017-02-20 21:30:57'),
	('68051BF4AA2743B030984B694628EE9C','数据库','2017-09-05 22:20:19'),
	('684892549c6f4df88e147eb0c252dcb6','APP','2017-02-07 12:00:00'),
	('69F69B59AAE6F4EE1A47BBC1086ECDB4','Socket','2017-03-07 10:34:24'),
	('6A620E3C07048291FDB26B6EDCEE7ABA','同步','2017-02-20 21:02:27'),
	('6DE9E0AFBA7328E44B19153A6733835C','后序','2017-02-18 21:26:44'),
	('724874D1BE77F450A09B305FC1534AFB','alias','2017-09-11 19:15:04'),
	('7898814832f34d91b9ed45eed7049837','测试','2017-02-07 12:00:00'),
	('7DDBE15C845FA27A2BAB496183042CA6','网络','2017-02-14 16:45:01'),
	('8178AD6FD9FE5CEEB9D3AA702AD45403','二叉树','2017-02-18 21:26:44'),
	('8347A927C09A4EC2FE473B0A93F667D0','修改','2017-02-07 12:00:00'),
	('88EAEC4C7BC4EC29AFA783666D0B53BC','剑指offer','2017-02-21 22:24:57'),
	('8936F53B23E9DFE2965D9E2EC23A4779','随笔','2017-09-11 14:55:50'),
	('89E6D2B383471FC370D828E552C19E65','fa','2017-09-24 19:59:41'),
	('8a1aeb3e96dd48b7873d9100062cd8d6','Linux','2017-02-07 12:00:00'),
	('912302CB020149C37F9642FBC9E42891','浏览器','2017-02-21 20:43:20'),
	('93F725A07423FE1C889F448B33D21F46','java','2017-02-07 12:00:00'),
	('9778840A0100CB30C982876741B0B5A2','SQL','2017-02-20 21:30:57'),
	('9ABFE4A03928EB88A75A5CD95822DFEF','前端','2017-09-05 22:15:29'),
	('9D0F8F6F657186A8F0F18F1EA92D1C95','职业规划','2017-03-10 19:32:13'),
	('A5C5D0DC90CCF0733D65742D59D28CCC','比赛','2017-07-21 17:51:58'),
	('a838b3281b5f471e8fe85aeae0eb0330','SSH','2017-02-07 12:00:00'),
	('adc1e0953e324138b9ed6b0603a69373','Git','2017-02-07 12:00:00'),
	('ADFC37610C59D9BD09BFFC3E9759F170','建站','2017-02-07 12:00:00'),
	('AFAEF14EBCFFDF11EF0A5D3E61B50866','并查集','2017-02-14 16:44:02'),
	('B6747DD73070743AE1F68AD64A80E873','激情','2017-09-22 23:29:13'),
	('BEE912D79EEFB7335988C4997AA9138D','查询','2017-02-20 21:30:57'),
	('C2EA3D934457181067DEC8B8DFA66E00','备案','2017-02-07 12:00:00'),
	('C50D13646EC66F1929DA5D491F2DFF0F','博客','2017-02-15 15:26:07'),
	('C72EC5AF9F5EC0DE360EC126CDA41672','菜鸟驿站','2017-03-10 19:32:13'),
	('C7A628CBA22E28EB17B5F5C6AE2A266A','css','2017-02-07 12:00:00'),
	('ce447e247965481baac6ea8745e49e43','Redis','2017-02-07 12:00:00'),
	('CF3882F1C43AB22BFF0BD9D82D83251B','IO','2017-03-07 10:34:24'),
	('CF4F2BADD0AED460A7C0758AE4EC4874','中序','2017-02-18 21:26:44'),
	('D276123C8BF8DABF3AE03A2A571ACD43','线程','2017-02-20 21:02:27'),
	('D3B7C913CD04EBFEC0E9EC32CB6FD58C','GitHub','2017-02-15 15:26:07'),
	('D52387880E1EA22817A72D3759213819','Java','2017-02-07 12:00:00'),
	('D95200B7462824DA8D5C86DF1D944D7D','理想','2017-09-22 23:29:13'),
	('DA9B26CFD7DE4FB79CABBDBC8FA05F61','tarjan','2017-02-14 16:41:48'),
	('DB06C78D1E24CF708A14CE81C9B617EC','测试','2017-02-07 12:00:00'),
	('DD29E7545EB8E590333BF6705D45BD71','layui','2017-02-15 15:26:07'),
	('E0407C4DA384781218D7D89D043BA67B','广度优先搜索','2017-02-14 16:37:51'),
	('E206A54E97690CCE50CC872DD70EE896','linux','2017-09-11 19:15:04'),
	('e686c30979dd452f98a59a53f4d8487c','Python','2017-02-07 12:00:00'),
	('F88522CF1B8A99E869EE231AC97BBC86','进程','2017-02-20 21:02:27'),
	('FC35FDC70D5FC69D269883A822C7A53E','html','2017-02-07 12:00:00');

UNLOCK TABLES;



CREATE TABLE `timeline` (
  `id` varchar(20) NOT NULL COMMENT '主键',
  `createdDate` datetime NOT NULL COMMENT '创建时间',
  `displayName` varchar(30) NOT NULL COMMENT '显示名称',
  `displayDate` datetime DEFAULT NULL COMMENT '显示日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `timeline` WRITE;

INSERT INTO `timeline` (`id`, `createdDate`, `displayName`, `displayDate`)
VALUES
	('201611','2017-01-14 12:12:34','2016年11月','2016-11-05 16:45:27'),
	('391202','2017-01-14 12:12:34','3912年02月','3912-02-01 00:00:00'),
	('391203','2017-01-14 12:12:34','3912年03月','3912-03-01 00:00:00'),
	('391204','2017-01-14 12:12:34','3912年04月','3912-04-01 00:00:00'),
	('391205','2017-01-14 12:12:34','3912年05月','3912-05-01 00:00:00'),
	('391206','2017-01-14 12:12:34','3912年06月','3912-06-01 00:00:00'),
	('391207','2017-01-14 12:12:34','3912年07月','3912-07-01 00:00:00'),
	('391208','2017-01-14 12:12:34','3912年08月','3912-08-01 00:00:00'),
	('391209','2017-01-14 12:12:34','3912年09月','3912-09-01 00:00:00'),
	('391210','2017-01-14 12:12:34','3912年10月','3912-10-01 00:00:00'),
	('391211','2017-01-14 12:12:34','3912年11月','3912-11-01 00:00:00'),
	('391212','2017-01-14 12:12:34','3912年12月','3912-12-01 00:00:00'),
	('391301','2017-01-14 12:12:34','3913年01月','3913-01-01 00:00:00'),
	('391402','2017-01-14 12:12:34','3914年02月','3914-02-01 00:00:00'),
	('391503','2017-01-14 12:12:34','3915年03月','3915-03-01 00:00:00'),
	('391604','2017-01-14 12:12:34','3916年04月','3916-04-01 00:00:00'),
	('391705','2017-01-14 12:12:34','3917年05月','3917-05-01 00:00:00'),
	('391806','2017-01-14 12:12:34','3918年06月','3918-06-01 00:00:00'),
	('391907','2017-01-14 12:12:34','3919年07月','3919-07-01 00:00:00'),
	('392008','2017-01-14 12:12:34','3920年08月','3920-08-01 00:00:00'),
	('392109','2017-01-14 12:12:34','3921年09月','3921-09-01 00:00:00'),
	('392210','2017-01-14 12:12:34','3922年10月','3922-10-01 00:00:00'),
	('392311','2017-01-14 12:12:34','3923年11月','3923-11-01 00:00:00'),
	('392412','2017-01-14 12:12:34','3924年12月','3924-12-01 00:00:00'),
	('392601','2017-01-14 12:12:34','3926年01月','3926-01-01 00:00:00'),
	('392802','2017-01-14 12:12:34','3928年02月','3928-02-01 00:00:00'),
	('393003','2017-01-14 12:12:34','3930年03月','3930-03-01 00:00:00'),
	('393204','2017-01-14 12:12:34','3932年04月','3932-04-01 00:00:00'),
	('393405','2017-01-14 12:12:34','3934年05月','3934-05-01 00:00:00'),
	('393606','2017-01-14 12:12:34','3936年06月','3936-06-01 00:00:00'),
	('393807','2017-01-14 12:12:34','3938年07月','3938-07-01 00:00:00'),
	('394008','2017-01-14 12:12:34','3940年08月','3940-08-01 00:00:00'),
	('394209','2017-01-14 12:12:34','3942年09月','3942-09-01 00:00:00'),
	('394410','2017-01-14 12:12:34','3944年10月','3944-10-01 00:00:00'),
	('394611','2017-01-14 12:12:34','3946年11月','3946-11-01 00:00:00'),
	('394812','2017-01-14 12:12:34','3948年12月','3948-12-01 00:00:00'),
	('395101','2017-01-14 12:12:34','3951年01月','3951-01-01 00:00:00'),
	('395402','2017-01-14 12:12:34','3954年02月','3954-02-01 00:00:00'),
	('395703','2017-01-14 12:12:34','3957年03月','3957-03-01 00:00:00'),
	('396004','2017-01-14 12:12:34','3960年04月','3960-04-01 00:00:00');

UNLOCK TABLES;



CREATE TABLE `type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `cdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `type` WRITE;

INSERT INTO `type` (`id`, `name`, `cdate`)
VALUES
	(1,'技术','2017-02-13 15:41:25'),
	(2,'随笔','2016-11-05 23:22:50'),
	(3,'杂谈','2017-02-12 21:44:42'),
	(6,'算法','2017-02-13 23:31:59');

UNLOCK TABLES;



CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `nickname` varchar(30) DEFAULT '游客',
  `headurl` varchar(100) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user` WRITE;

INSERT INTO `user` (`id`, `username`, `password`, `nickname`, `headurl`)
VALUES
	(737,'admin','E10ADC3949BA59ABBE56E057F20F883E','hunter','n');

UNLOCK TABLES;



CREATE TABLE `youlian` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `cdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `youlian` WRITE;

INSERT INTO `youlian` (`id`, `name`, `logo`, `url`, `cdate`)
VALUES
	(3,'我的GitHub',NULL,'https://github.com/hujianhong','2017-02-05 19:57:53'),
	(4,'我的旅行',NULL,'http://travel.huding.name','2017-02-10 19:08:30'),
	(5,'我的码云',NULL,'https://git.oschina.net/hujianhong','2017-02-25 10:20:16'),
	(6,'51微投票',NULL,'http://www.omlzz.com/','2017-02-05 19:42:50'),
	(11,'layui前端框架',NULL,'http://www.layui.com','2017-02-10 23:15:31'),
	(13,'MonkeyBlog',NULL,'http://www.houchaowei.com','2017-03-09 09:29:47'),
	(14,'Laychat即时通讯系统',NULL,'http://lay.laychat.cn','2017-04-14 14:03:42'),
	(15,'ChenJY\'sBlog',NULL,'http://chenjiayang.me/','2017-08-30 09:32:15');

UNLOCK TABLES;







CREATE VIEW `blog_display`
AS SELECT
   `category`.`name` AS `categoryName`,
   `blog`.`id` AS `id`,
   `blog`.`title` AS `title`,
   `blog`.`author` AS `author`,
   `blog`.`summary` AS `summary`,
   `blog`.`commentNum` AS `commentNum`,
   `blog`.`readNum` AS `readNum`,
   `blog`.`url` AS `url`,
   `blog`.`publishTime` AS `publishTime`,
   `blog`.`type` AS `type`,
   `blog`.`status` AS `status`,
   `blog`.`coverURL` AS `coverURL`,
   `blog`.`heartNum` AS `heartNum`,
   `blog`.`tags` AS `tags`,
   `type`.`name` AS `typeName`,
   `type`.`id` AS `typeID`,
   `category`.`id` AS `categoryID`,
   `blog`.`content` AS `content`
FROM ((`category` join `blog`) join `type`) where ((`category`.`id` = `blog`.`categoryID`) and (`category`.`typeID` = `type`.`id`));




CREATE VIEW `blog_back_display`
AS SELECT
   `category`.`name` AS `categoryName`,
   `blog`.`id` AS `id`,
   `blog`.`title` AS `title`,
   `blog`.`author` AS `author`,
   `blog`.`commentNum` AS `commentNum`,
   `blog`.`readNum` AS `readNum`,
   `blog`.`url` AS `url`,
   `blog`.`publishTime` AS `publishTime`,
   `blog`.`type` AS `type`,
   `blog`.`status` AS `status`,
   `blog`.`statusName` AS `statusName`,
   `blog`.`heartNum` AS `heartNum`
FROM (`category` join `blog`) where (`category`.`id` = `blog`.`categoryID`);





CREATE VIEW `blog_display_by_tag`
AS SELECT
   `category`.`name` AS `categoryName`,
   `blog`.`id` AS `id`,
   `blog`.`title` AS `title`,
   `blog`.`author` AS `author`,
   `blog`.`summary` AS `summary`,
   `blog`.`commentNum` AS `commentNum`,
   `blog`.`readNum` AS `readNum`,
   `blog`.`url` AS `url`,
   `blog`.`publishTime` AS `publishTime`,
   `blog`.`type` AS `type`,
   `blog`.`status` AS `status`,
   `blog`.`coverURL` AS `coverURL`,
   `blog`.`heartNum` AS `heartNum`,
   `blog`.`tags` AS `tags`,
   `type`.`name` AS `typeName`,
   `type`.`id` AS `typeID`,
   `category`.`id` AS `categoryID`,
   `tags`.`id` AS `tagID`,
   `tags`.`name` AS `tagName`
FROM ((((`category` join `blog`) join `type`) join `blog_tags`) join `tags`) where ((`category`.`id` = `blog`.`categoryID`) and (`category`.`typeID` = `type`.`id`) and (`blog_tags`.`blogID` = `blog`.`id`) and (`blog_tags`.`tagID` = `tags`.`id`));

