/*
Navicat MySQL Data Transfer

Source Server         : localhost3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : db_blog

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2019-09-03 17:02:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_blog
-- ----------------------------
DROP TABLE IF EXISTS `t_blog`;
CREATE TABLE `t_blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `summary` varchar(400) DEFAULT NULL,
  `releaseDate` datetime DEFAULT NULL,
  `clickHit` int(11) DEFAULT NULL,
  `replyHit` int(11) DEFAULT NULL,
  `content` text,
  `typeId` int(11) DEFAULT NULL,
  `keyWord` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `typeId` (`typeId`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_blog
-- ----------------------------
INSERT INTO `t_blog` VALUES ('1', '范德萨2', '$.document.ready(function(){  UE.getEditor(\'editor\').setContent(\'欢迎光临\');})setContent方法无法加载内容，提示编辑器为空，后来想想，可能是编辑器还没有加载完就执行此脚本导致的。后在网上找资料，可以判断ueditor编辑器完成加载后', '2016-02-12 15:39:50', '110', '13', '<p style=\"margin: 10px auto; text-indent: 0px; color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25.2000007629395px; orphans: auto; text-align: start; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">$.document.ready(function()</p><p style=\"margin: 10px auto; text-indent: 0px; color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25.2000007629395px; orphans: auto; text-align: start; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">{</p><p style=\"margin: 10px auto; text-indent: 0px; color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25.2000007629395px; orphans: auto; text-align: start; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">&nbsp; UE.getEditor(&#39;editor&#39;).setContent(&#39;欢迎光临&#39;);</p><p style=\"margin: 10px auto; text-indent: 0px; color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25.2000007629395px; orphans: auto; text-align: start; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">})</p><p style=\"margin: 10px auto; text-indent: 0px; color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25.2000007629395px; orphans: auto; text-align: start; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">setContent方法无法加载内容，提示编辑器为空，后来想想，可能是编辑器还没有加载完就执行此脚本导致的。后在网上找资料，可以判断ueditor编辑器完成加载后再加载内容：</p><p style=\"margin: 10px auto; text-indent: 0px; color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25.2000007629395px; orphans: auto; text-align: start; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\"><span class=\"kw2\">核心内容如下</span></p><p style=\"margin: 10px auto; text-indent: 0px; color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25.2000007629395px; orphans: auto; text-align: start; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\"><span class=\"kw2\">var</span><span class=\"Apple-converted-space\">&nbsp;</span>editor_a<span class=\"Apple-converted-space\">&nbsp;</span><span class=\"sy0\">=</span><span class=\"Apple-converted-space\">&nbsp;</span><span class=\"kw2\">new</span><span class=\"Apple-converted-space\">&nbsp;</span>baidu.<span class=\"me1\">editor</span>.<span class=\"me1\">ui</span>.<span class=\"me1\">Editor</span><span class=\"br0\">(</span>editorOption<span class=\"br0\">)</span><span class=\"sy0\">;</span><br/>&nbsp; &nbsp; editor_a.<span class=\"me1\">render</span><span class=\"br0\">(</span><span class=\"st0\">&#39;myEditor&#39;</span><span class=\"br0\">)</span><span class=\"sy0\">;</span><br/>&nbsp; &nbsp; editor_a.<span class=\"me1\">ready</span><span class=\"br0\">(</span><span class=\"kw2\">function</span><span class=\"br0\">(</span><span class=\"br0\">)</span><span class=\"Apple-converted-space\">&nbsp;</span><span class=\"br0\">{</span><br/>&nbsp; &nbsp; &nbsp; &nbsp; editor_a.<span class=\"me1\">setContent</span><span class=\"br0\">(</span>$<span class=\"br0\">(</span><span class=\"st0\">&#39;#content&#39;</span><span class=\"br0\">)</span>.<span class=\"me1\">val</span><span class=\"br0\">(</span><span class=\"br0\">)</span><span class=\"br0\">)</span><span class=\"sy0\">;</span><br/>&nbsp; &nbsp;<span class=\"Apple-converted-space\">&nbsp;</span><span class=\"br0\">}</span><span class=\"br0\">)</span><span class=\"sy0\">;</span></p><p style=\"margin: 10px auto; text-indent: 0px; color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25.2000007629395px; orphans: auto; text-align: start; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">&nbsp;</p><p style=\"margin: 10px auto; text-indent: 0px; color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25.2000007629395px; orphans: auto; text-align: start; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\"><span class=\"sy0\">具体例子：</span></p><p>$<span class=\"br0\">(</span>document<span class=\"br0\">)</span>.<span class=\"me1\">ready</span><span class=\"br0\">(</span><span class=\"kw2\">function</span><span class=\"Apple-converted-space\">&nbsp;</span><span class=\"br0\">(</span><span class=\"br0\">)</span><span class=\"Apple-converted-space\">&nbsp;</span><span class=\"br0\">{</span><br/>&nbsp; &nbsp;<span class=\"Apple-converted-space\">&nbsp;</span><span class=\"co1\">// 自定义的编辑器配置项,此处定义的配置项将覆盖editor_config.js中的同名配置</span><br/>&nbsp; &nbsp;<span class=\"Apple-converted-space\">&nbsp;</span><span class=\"kw2\">var</span><span class=\"Apple-converted-space\">&nbsp;</span>editorOption<span class=\"Apple-converted-space\">&nbsp;</span><span class=\"sy0\">=</span><span class=\"Apple-converted-space\">&nbsp;</span><span class=\"br0\">{</span><br/>&nbsp; &nbsp; &nbsp; &nbsp;<span class=\"Apple-converted-space\">&nbsp;</span><span class=\"co1\">//这里可以选择自己需要的工具按钮名称,此处仅选择如下五个</span><br/>&nbsp; &nbsp; &nbsp; &nbsp; toolbars<span class=\"sy0\">:</span><span class=\"Apple-converted-space\">&nbsp;</span><span class=\"br0\">[</span><span class=\"br0\">[</span><span class=\"st0\">&#39;FullScreen&#39;</span><span class=\"sy0\">,</span><span class=\"Apple-converted-space\">&nbsp;</span><span class=\"st0\">&#39;Source&#39;</span><span class=\"sy0\">,</span><span class=\"Apple-converted-space\">&nbsp;</span><span class=\"st0\">&#39;Undo&#39;</span><span class=\"sy0\">,</span><span class=\"Apple-converted-space\">&nbsp;</span><span class=\"st0\">&#39;Redo&#39;</span><span class=\"sy0\">,</span><span class=\"Apple-converted-space\">&nbsp;</span><span class=\"st0\">&#39;Bold&#39;</span><span class=\"sy0\">,</span><span class=\"Apple-converted-space\">&nbsp;</span><span class=\"st0\">&#39;forecolor&#39;</span><span class=\"sy0\">,</span><span class=\"Apple-converted-space\">&nbsp;</span><span class=\"st0\">&#39;link&#39;</span><span class=\"sy0\">,</span><span class=\"Apple-converted-space\">&nbsp;</span><span class=\"st0\">&#39;highlightcode&#39;</span><span class=\"br0\">]</span><span class=\"br0\">]</span><span class=\"sy0\">,</span><br/>&nbsp; &nbsp; &nbsp; &nbsp;<span class=\"Apple-converted-space\">&nbsp;</span><span class=\"co1\">//focus时自动清空初始化时的内容</span><br/>&nbsp; &nbsp; &nbsp; &nbsp; autoClearinitialContent<span class=\"sy0\">:</span><span class=\"Apple-converted-space\">&nbsp;</span><span class=\"kw2\">true</span><span class=\"sy0\">,</span><br/>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span class=\"co1\">//关闭elementPath</span><br/>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;elementPathEnabled<span class=\"sy0\">:</span><span class=\"Apple-converted-space\">&nbsp;</span><span class=\"kw2\">false</span><br/>&nbsp; &nbsp;<span class=\"Apple-converted-space\">&nbsp;</span><span class=\"br0\">}</span><span class=\"sy0\">;</span><br/>&nbsp; &nbsp;<span class=\"Apple-converted-space\">&nbsp;</span><span class=\"kw2\">var</span><span class=\"Apple-converted-space\">&nbsp;</span>editor_a<span class=\"Apple-converted-space\">&nbsp;</span><span class=\"sy0\">=</span><span class=\"Apple-converted-space\">&nbsp;</span><span class=\"kw2\">new</span><span class=\"Apple-converted-space\">&nbsp;</span>baidu.<span class=\"me1\">editor</span>.<span class=\"me1\">ui</span>.<span class=\"me1\">Editor</span><span class=\"br0\">(</span>editorOption<span class=\"br0\">)</span><span class=\"sy0\">;</span><br/>&nbsp; &nbsp; editor_a.<span class=\"me1\">render</span><span class=\"br0\">(</span><span class=\"st0\">&#39;myEditor&#39;</span><span class=\"br0\">)</span><span class=\"sy0\">;</span><br/>&nbsp; &nbsp; editor_a.<span class=\"me1\">ready</span><span class=\"br0\">(</span><span class=\"kw2\">function</span><span class=\"br0\">(</span><span class=\"br0\">)</span><span class=\"Apple-converted-space\">&nbsp;</span><span class=\"br0\">{</span><br/>&nbsp; &nbsp; &nbsp; &nbsp; editor_a.<span class=\"me1\">setContent</span><span class=\"br0\">(</span>$<span class=\"br0\">(</span><span class=\"st0\">&#39;#content&#39;</span><span class=\"br0\">)</span>.<span class=\"me1\">val</span><span class=\"br0\">(</span><span class=\"br0\">)</span><span class=\"br0\">)</span><span class=\"sy0\">;</span><span class=\"Apple-converted-space\">&nbsp;</span>&nbsp;<span class=\"co1\">//赋值给UEditor</span><br/>&nbsp; &nbsp;<span class=\"Apple-converted-space\">&nbsp;</span><span class=\"br0\">}</span><span class=\"br0\">)</span><span class=\"sy0\">;</span><br/>&nbsp; &nbsp; $<span class=\"br0\">(</span><span class=\"st0\">&#39;#title&#39;</span><span class=\"br0\">)</span>.<span class=\"me1\">val</span><span class=\"br0\">(</span>title<span class=\"br0\">)</span><span class=\"sy0\">;</span><span class=\"Apple-converted-space\">&nbsp;</span><span class=\"co1\">//title赋值</span><br/><span class=\"br0\">}</span><span class=\"br0\">)</span><span class=\"sy0\">;</span></p><p><br/></p>', '1', null);
INSERT INTO `t_blog` VALUES ('2', '正则表达式学习一', '尽管脑海里有很多关于你的美好的想法，但是现实证明，终究我还是空想而已。我曾经想过你', '2016-01-13 15:40:16', '12', '1', '尽管脑海里有很多关于你的美好的想法，但是现实证明，终究我还是空想而已。我曾经想过你会开口挽留我，但是你终究还是一句话也没有说，只是看着我走远；我曾经想过你会要我去你的城市，但是你终究还是客气的婉拒，如果我不是那么敏感，或许我会厚脸皮的去投奔你，但是现实是我听懂了你的拒绝，也没有勇气去揭开那层面纱；我曾经想过我们会在某一个阳光明媚的早晨，一起散步一起买早餐，但是如今你会散步会按时吃早餐，只是身边不是我；我曾经想过我们会一起去某个我们都想要去的地方，欣赏路边的野花、呼吸相同的空气，最后你去了我们一直想去但是却因为各种各样的原因而没有去成的地方，身边是美丽的她；我曾经想过我会为你穿上美丽的婚纱，做你最漂亮的妻子，为你洗衣做饭、生儿育女，但是婚礼上你的妻子却并不是我，而是另一个贤惠的她；我曾经想过很多很多，但是现实证明，那的确只能是空想。如今的我不再想象有你的生活，不再期待也不再彷徨，我会过的很好，也希望你能幸福，最后祝你新婚快乐！！！', '2', null);
INSERT INTO `t_blog` VALUES ('4', '是', null, '2015-06-27 15:41:44', '10', '1', '尽管脑海里有很多关于你的美好的想法，但是现实证明，终究我还是空想而已。我曾经想过你会开口挽留我，但是你终究还是一句话也没有说，只是看着我走远；我曾经想过你会要我去你的城市，但是你终究还是客气的婉拒，如果我不是那么敏感，或许我会厚脸皮的去投奔你，但是现实是我听懂了你的拒绝，也没有勇气去揭开那层面纱；我曾经想过我们会在某一个阳光明媚的早晨，一起散步一起买早餐，但是如今你会散步会按时吃早餐，只是身边不是我；我曾经想过我们会一起去某个我们都想要去的地方，欣赏路边的野花、呼吸相同的空气，最后你去了我们一直想去但是却因为各种各样的原因而没有去成的地方，身边是美丽的她；我曾经想过我会为你穿上美丽的婚纱，做你最漂亮的妻子，为你洗衣做饭、生儿育女，但是婚礼上你的妻子却并不是我，而是另一个贤惠的她；我曾经想过很多很多，但是现实证明，那的确只能是空想。如今的我不再想象有你的生活，不再期待也不再彷徨，我会过的很好，也希望你能幸福，最后祝你新婚快乐！！！', '3', null);
INSERT INTO `t_blog` VALUES ('5', '是的', null, '2016-01-11 15:41:52', '10', '1', '尽管脑海里有很多关于你的美好的想法，但是现实证明，终究我还是空想而已。我曾经想过你会开口挽留我，但是你终究还是一句话也没有说，只是看着我走远；我曾经想过你会要我去你的城市，但是你终究还是客气的婉拒，如果我不是那么敏感，或许我会厚脸皮的去投奔你，但是现实是我听懂了你的拒绝，也没有勇气去揭开那层面纱；我曾经想过我们会在某一个阳光明媚的早晨，一起散步一起买早餐，但是如今你会散步会按时吃早餐，只是身边不是我；我曾经想过我们会一起去某个我们都想要去的地方，欣赏路边的野花、呼吸相同的空气，最后你去了我们一直想去但是却因为各种各样的原因而没有去成的地方，身边是美丽的她；我曾经想过我会为你穿上美丽的婚纱，做你最漂亮的妻子，为你洗衣做饭、生儿育女，但是婚礼上你的妻子却并不是我，而是另一个贤惠的她；我曾经想过很多很多，但是现实证明，那的确只能是空想。如今的我不再想象有你的生活，不再期待也不再彷徨，我会过的很好，也希望你能幸福，最后祝你新婚快乐！！！', '4', null);
INSERT INTO `t_blog` VALUES ('6', '搜索多少', null, '2016-01-12 15:42:22', '10', '1', '尽管脑海里有很多关于你的美好的想法，但是现实证明，终究我还是空想而已。我曾经想过你会开口挽留我，但是你终究还是一句话也没有说，只是看着我走远；我曾经想过你会要我去你的城市，但是你终究还是客气的婉拒，如果我不是那么敏感，或许我会厚脸皮的去投奔你，但是现实是我听懂了你的拒绝，也没有勇气去揭开那层面纱；我曾经想过我们会在某一个阳光明媚的早晨，一起散步一起买早餐，但是如今你会散步会按时吃早餐，只是身边不是我；我曾经想过我们会一起去某个我们都想要去的地方，欣赏路边的野花、呼吸相同的空气，最后你去了我们一直想去但是却因为各种各样的原因而没有去成的地方，身边是美丽的她；我曾经想过我会为你穿上美丽的婚纱，做你最漂亮的妻子，为你洗衣做饭、生儿育女，但是婚礼上你的妻子却并不是我，而是另一个贤惠的她；我曾经想过很多很多，但是现实证明，那的确只能是空想。如今的我不再想象有你的生活，不再期待也不再彷徨，我会过的很好，也希望你能幸福，最后祝你新婚快乐！！！', '4', null);
INSERT INTO `t_blog` VALUES ('7', '搜索多少', null, '2016-01-19 14:43:39', '10', '1', '尽管脑海里有很多关于你的美好的想法，但是现实证明，终究我还是空想而已。我曾经想过你会开口挽留我，但是你终究还是一句话也没有说，只是看着我走远；我曾经想过你会要我去你的城市，但是你终究还是客气的婉拒，如果我不是那么敏感，或许我会厚脸皮的去投奔你，但是现实是我听懂了你的拒绝，也没有勇气去揭开那层面纱；我曾经想过我们会在某一个阳光明媚的早晨，一起散步一起买早餐，但是如今你会散步会按时吃早餐，只是身边不是我；我曾经想过我们会一起去某个我们都想要去的地方，欣赏路边的野花、呼吸相同的空气，最后你去了我们一直想去但是却因为各种各样的原因而没有去成的地方，身边是美丽的她；我曾经想过我会为你穿上美丽的婚纱，做你最漂亮的妻子，为你洗衣做饭、生儿育女，但是婚礼上你的妻子却并不是我，而是另一个贤惠的她；我曾经想过很多很多，但是现实证明，那的确只能是空想。如今的我不再想象有你的生活，不再期待也不再彷徨，我会过的很好，也希望你能幸福，最后祝你新婚快乐！！！', '1', null);
INSERT INTO `t_blog` VALUES ('8', '萨', null, '2016-01-19 14:43:59', '10', '1', '尽管脑海里有很多关于你的美好的想法，但是现实证明，终究我还是空想而已。我曾经想过你会开口挽留我，但是你终究还是一句话也没有说，只是看着我走远；我曾经想过你会要我去你的城市，但是你终究还是客气的婉拒，如果我不是那么敏感，或许我会厚脸皮的去投奔你，但是现实是我听懂了你的拒绝，也没有勇气去揭开那层面纱；我曾经想过我们会在某一个阳光明媚的早晨，一起散步一起买早餐，但是如今你会散步会按时吃早餐，只是身边不是我；我曾经想过我们会一起去某个我们都想要去的地方，欣赏路边的野花、呼吸相同的空气，最后你去了我们一直想去但是却因为各种各样的原因而没有去成的地方，身边是美丽的她；我曾经想过我会为你穿上美丽的婚纱，做你最漂亮的妻子，为你洗衣做饭、生儿育女，但是婚礼上你的妻子却并不是我，而是另一个贤惠的她；我曾经想过很多很多，但是现实证明，那的确只能是空想。如今的我不再想象有你的生活，不再期待也不再彷徨，我会过的很好，也希望你能幸福，最后祝你新婚快乐！！！', '2', null);
INSERT INTO `t_blog` VALUES ('9', '多少', null, '2016-01-18 14:44:02', '10', '1', '尽管脑海里有很多关于你的美好的想法，但是现实证明，终究我还是空想而已。我曾经想过你会开口挽留我，但是你终究还是一句话也没有说，只是看着我走远；我曾经想过你会要我去你的城市，但是你终究还是客气的婉拒，如果我不是那么敏感，或许我会厚脸皮的去投奔你，但是现实是我听懂了你的拒绝，也没有勇气去揭开那层面纱；我曾经想过我们会在某一个阳光明媚的早晨，一起散步一起买早餐，但是如今你会散步会按时吃早餐，只是身边不是我；我曾经想过我们会一起去某个我们都想要去的地方，欣赏路边的野花、呼吸相同的空气，最后你去了我们一直想去但是却因为各种各样的原因而没有去成的地方，身边是美丽的她；我曾经想过我会为你穿上美丽的婚纱，做你最漂亮的妻子，为你洗衣做饭、生儿育女，但是婚礼上你的妻子却并不是我，而是另一个贤惠的她；我曾经想过很多很多，但是现实证明，那的确只能是空想。如今的我不再想象有你的生活，不再期待也不再彷徨，我会过的很好，也希望你能幸福，最后祝你新婚快乐！！！', '3', null);
INSERT INTO `t_blog` VALUES ('11', '啊', null, '2016-01-25 11:41:52', '10', '1', '<p>倒萨<br/></p>', '1', null);
INSERT INTO `t_blog` VALUES ('12', 'fda', null, '2016-01-25 14:19:29', '10', '1', '<p>fds</p>', '1', null);
INSERT INTO `t_blog` VALUES ('13', '4份f 码', '尽管脑海里有很多关于你的美好的想法，但是现实证明，终究我还是空想而已。我曾经想过你会开口挽留我，但是你终究还是一句话也没有说，只是看着我走远；我曾经想过你会要我去你的城市，但是你终究还是客气的婉拒，如果我不是那么敏感，或许我会厚脸皮的去投奔你，但是现实是我听懂了你的拒绝，也没有勇气去揭开那层面纱；我曾经想过我', '2016-01-25 14:24:56', '11', '1', '<p>尽管脑海里有很多关于你的美好的想法，但是现实证明，终究我还是空想而已。我曾经想过你会开口挽留我，但是你终究还是一句话也没有说，只是看着我走远；我曾经想过你会要我去你的城市，但是你终究还是客气的婉拒，如果我不是那么敏感，或许我会厚脸皮的去投奔你，但是现实是我听懂了你的拒绝，也没有勇气去揭开那层面纱；我曾经想过我们会在某一个阳光明媚的早晨，一起散步一起买早餐，但是如今你会散步会按时吃早餐，只是身边不是我；我曾经想过我们会一起去某个我们都想要去的地方，欣赏路边的野花、呼吸相同的空气，最后你去了我们一直想去但是却因为各种各样的原因而没有去成的地方，身边是美丽的她；我曾经想过我会为你穿上美丽的婚纱，做你最漂亮的妻子，为你洗衣做饭、生儿育女，但是婚礼上你的妻子却并不是我，而是另一个贤惠的她；我曾经想过很多很多，但是现实证明，那的确只能是空想。如今的我不再想象有你的生活，不再期待也不再彷徨，我会过的很好，也希望你能幸福，最后祝你新婚快乐！！！</p>', '1', null);
INSERT INTO `t_blog` VALUES ('14', '萨', '尽管脑海也不再彷徨，我会过的很好，也希望你能幸福，最后祝', '2016-01-25 14:32:52', '10', '1', '<p><span style=\"color: rgb(0, 0, 0); font-family: sans-serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none;\">尽管脑海也不再彷徨，我会过的很好，也希望你能幸福，最后祝</span></p>', '1', null);
INSERT INTO `t_blog` VALUES ('15', '是多少', '大是v', '2016-01-25 14:39:16', '10', '1', '<p>大是v<br/></p>', '1', null);
INSERT INTO `t_blog` VALUES ('16', '速读法', '打算', '2016-01-25 14:40:09', '12', '1', '<p>打算<br/></p>', '2', null);
INSERT INTO `t_blog` VALUES ('17', 'fd', 'da', '2016-01-26 11:10:11', '0', '0', '<p>da<br/></p>', '2', null);
INSERT INTO `t_blog` VALUES ('18', 'da', 'da', '2016-01-28 10:26:32', '0', '0', '<p>da<br/></p>', '1', null);
INSERT INTO `t_blog` VALUES ('19', 'dsa', 'da', '2016-01-29 15:26:47', '0', '0', '<p>da</p>', '2', null);
INSERT INTO `t_blog` VALUES ('20', 'sds', 'ds', '2016-01-29 15:31:18', '0', '0', '<p>ds</p>', '2', null);
INSERT INTO `t_blog` VALUES ('21', 'dfa', 'dsa', '2016-01-29 15:35:30', '0', '0', '<p>dsa</p>', '2', null);
INSERT INTO `t_blog` VALUES ('22', 'sdf', 'fdas', '2016-01-29 16:10:13', '0', '0', '<p>fdas</p>', '1', null);
INSERT INTO `t_blog` VALUES ('26', 'fad2', 'das 哈哈', '2016-01-29 17:29:28', '0', '0', '<p>das 哈哈</p>', '2', null);
INSERT INTO `t_blog` VALUES ('28', 'dsa', 'das', '2016-01-29 17:59:24', '0', '0', '<p>das</p>', '1', null);
INSERT INTO `t_blog` VALUES ('29', '《Beginning JavaScript, 5th Edition》PDF 下载', 'qwssds', '2016-01-29 18:00:14', '0', '0', '<p>qwssds</p>', '3', null);
INSERT INTO `t_blog` VALUES ('31', '《Beginning JavaScript, 5th Edition》PDF 下载', 'dsds', '2016-01-29 18:06:22', '0', '0', '<p>dsds</p>', '1', null);
INSERT INTO `t_blog` VALUES ('32', '《Beginning JavaScript, 5th Edition》PDF 下载', 'dsa', '2016-01-29 18:07:33', '1', '0', '<p>dsa</p>', '1', null);
INSERT INTO `t_blog` VALUES ('33', '《WebGL编程指南(试读)》PDF 下载公司', '工资相对比较满意公司优点：1.锻炼人能力；2.可以修年假；3.办公环境还不错。 对公司还是感恩的，如果不是一个偶然的机会，我也许还在其他小城市朝九晚五。在我四处漂泊的同时，公司的待遇也让我成了家，有了房子和车子，安定于这个陌生浮躁的都市。在我遇到的绝大多数领导和同事还是温和互助的，当然关系不似死党般无话不谈，', '2016-01-31 16:07:20', '15', '0', '<p><span style=\"color: rgb(102, 102, 102); font-family: Arial, &#39;Hiragino Sans GB&#39;, STHeiti, &#39;Microsoft YaHei&#39;, simsun, sans-serif; font-size: 14px; line-height: 28px; background-color: rgb(255, 255, 255);\">工资相对比较满意公司优点：</span><br style=\"color: rgb(102, 102, 102); font-family: Arial, &#39;Hiragino Sans GB&#39;, STHeiti, &#39;Microsoft YaHei&#39;, simsun, sans-serif; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(102, 102, 102); font-family: Arial, &#39;Hiragino Sans GB&#39;, STHeiti, &#39;Microsoft YaHei&#39;, simsun, sans-serif; font-size: 14px; line-height: 28px; background-color: rgb(255, 255, 255);\">1.锻炼人能力；</span><br style=\"color: rgb(102, 102, 102); font-family: Arial, &#39;Hiragino Sans GB&#39;, STHeiti, &#39;Microsoft YaHei&#39;, simsun, sans-serif; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(102, 102, 102); font-family: Arial, &#39;Hiragino Sans GB&#39;, STHeiti, &#39;Microsoft YaHei&#39;, simsun, sans-serif; font-size: 14px; line-height: 28px; background-color: rgb(255, 255, 255);\">2.可以修年假；</span><br style=\"color: rgb(102, 102, 102); font-family: Arial, &#39;Hiragino Sans GB&#39;, STHeiti, &#39;Microsoft YaHei&#39;, simsun, sans-serif; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(102, 102, 102); font-family: Arial, &#39;Hiragino Sans GB&#39;, STHeiti, &#39;Microsoft YaHei&#39;, simsun, sans-serif; font-size: 14px; line-height: 28px; background-color: rgb(255, 255, 255);\">3.办公环境还不错。&nbsp;</span><br style=\"color: rgb(102, 102, 102); font-family: Arial, &#39;Hiragino Sans GB&#39;, STHeiti, &#39;Microsoft YaHei&#39;, simsun, sans-serif; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(102, 102, 102); font-family: Arial, &#39;Hiragino Sans GB&#39;, STHeiti, &#39;Microsoft YaHei&#39;, simsun, sans-serif; font-size: 14px; line-height: 28px; background-color: rgb(255, 255, 255);\">对公司还是感恩的，如果不是一个偶然的机会，我也许还在其他小城市朝九晚五。在我四处漂泊的同时，公司的待遇也让我成了家，有了房子和车子，安定于这个陌生浮躁的都市。在我遇到的绝大多数领导和同事还是温和互助的，当然关系不似死党般无话不谈，可是公司的关系就是一种这么相敬如宾的和谐和清淡，保持一个合适的距离，大家都有一个安全的范围。我相信在公司，会比一般规矩工作的同学待遇高，可是比起做生意，投资或者公务员你就失落很多了。在深圳这些钱，遇到什么事情，估计你还是没法搞定，也没有一个人际圈子可以支持你搞定工作以外的这些杂事，这也是很多在异地生存的打工者的悲哀。</span></p>', '1', null);
INSERT INTO `t_blog` VALUES ('34', '公司不好', '我朋友他开始做的时候每天100多收入，然后介绍我来，我新站，后来辛辛苦苦到100了，封我号，我朋友的收入也从100多一直降，降到了40多。封号就不说了，问客服没人理，都不知道为啥今天要提现了就封我号。公司。', '2016-01-31 16:15:30', '4', '0', '<pre style=\"margin-top: 10px; margin-bottom: 15px; font-family: &#39;Microsoft Yahei&#39;, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; word-wrap: break-word; word-break: break-all; overflow: hidden; padding: 0px; color: rgb(136, 136, 136); line-height: 1.8; background-color: rgb(255, 255, 255);\">我朋友他开始做的时候每天100多收入，然后介绍我来，我新站，后来辛辛苦苦到100了，封我号，我朋友的收入也从100多一直降，降到了40多。\n封号就不说了，问客服没人理，都不知道为啥今天要提现了就封我号。公司。</pre>', '3', null);
INSERT INTO `t_blog` VALUES ('35', '公司不好3', '放大范德萨 垃圾公司。', '2016-01-31 17:05:52', '4', '0', '<p>放大范德萨 垃圾公司。</p>', '3', null);
INSERT INTO `t_blog` VALUES ('36', '公司啊公司', '放大 公司。', '2016-01-31 17:06:20', '2', '0', '<p>放大 公司。</p>', '2', null);
INSERT INTO `t_blog` VALUES ('37', 'fda', 'package com.java1234.demo;/** * 测试 * @author Administrator * */public class HelloWorld {	public static void main(String[] args) {		System.out.println(\"Hell', '2016-02-02 10:09:46', '10', '0', '<pre class=\"brush:java;toolbar:false\">package&nbsp;com.java1234.demo;\n\n/**\n&nbsp;*&nbsp;测试\n&nbsp;*&nbsp;@author&nbsp;Administrator\n&nbsp;*\n&nbsp;*/\npublic&nbsp;class&nbsp;HelloWorld&nbsp;{\n\n	public&nbsp;static&nbsp;void&nbsp;main(String[]&nbsp;args)&nbsp;{\n		System.out.println(&quot;Hello&nbsp;World，屌炸天！&quot;);\n	}\n}</pre><p><br/></p>', '3', null);
INSERT INTO `t_blog` VALUES ('38', 'Java HelloWorld实现', ' 第一个博客，当然从HelloWorld 开发，主要测试下 百度ueditor的代码高亮效果如何。下面上代码：package com.java1234.demo;/** * 测试 * @author Administrator * */public class HelloWorld {	public stat', '2016-02-02 10:32:14', '25', '2', '<p style=\"white-space: normal;\"><img src=\"http://img.baidu.com/hi/jx2/j_0013.gif\"/>&nbsp;第一个博客，当然从HelloWorld 开发，主要测试下 百度ueditor的代码高亮效果如何。</p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\">下面上代码：</p><pre class=\"brush:java;toolbar:false\">package&nbsp;com.java1234.demo;\n\n/**\n&nbsp;*&nbsp;测试\n&nbsp;*&nbsp;@author&nbsp;Administrator\n&nbsp;*\n&nbsp;*/\npublic&nbsp;class&nbsp;HelloWorld&nbsp;{\n\n	public&nbsp;static&nbsp;void&nbsp;main(String[]&nbsp;args)&nbsp;{\n		System.out.println(&quot;Hello&nbsp;World，屌炸天！&quot;);\n	}\n}</pre><p><br/></p><p style=\"white-space: normal;\">代码高亮还算凑合，如果加上 复制代码功能，会更好点；</p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\">这个图我是直接用百度ueditor直接截图的，很方便。这个是我选用百度ueditor在线编辑器的一个重要原因。</p><p><br/></p>', '1', null);
INSERT INTO `t_blog` VALUES ('39', '关键字测试', '地方撒放大多少', '2016-02-13 12:41:48', '0', '0', '<p>地方撒放大多少</p>', '1', null);
INSERT INTO `t_blog` VALUES ('40', 'dsa', 'fda', '2016-02-13 12:45:29', '1', '0', '<p>fda</p>', '3', null);
INSERT INTO `t_blog` VALUES ('41', 'fdas', 'fd', '2016-02-13 12:45:45', '13', '1', '<p>fd</p>', '1', 'da   d是2  java');
INSERT INTO `t_blog` VALUES ('42', '图片测试', '放大大fda', '2016-02-14 11:00:34', '12', '0', '<p>放大大</p><p>fda</p><p><br/></p><p><br/></p><p><img src=\'http://localhost:8080/Blog/static/userImages/xiaofeng.jpg\' title=\'1455418826833058077.jpg\' alt=\'1-15050FU313Q2.jpg\'/><img src=\'http://localhost:8080/Blog/static/userImages/aa.jpg\' title=\'1455418826833058077.jpg\' alt=\'1-15050FU313Q2.jpg\'/><img src=\'http://localhost:8080/Blog/static/userImages/bb.jpg\' title=\'1455418826833058077.jpg\' alt=\'1-15050FU313Q2.jpg\'/></p>', '1', '');
INSERT INTO `t_blog` VALUES ('43', 'fa', 'fda', '2016-02-14 13:02:31', '0', '0', '<p>fda</p>', '1', '');
INSERT INTO `t_blog` VALUES ('44', 'dsa', 'dsa', '2016-02-14 13:09:49', '1', '0', '<p>dsa</p>', '2', '');
INSERT INTO `t_blog` VALUES ('45', 'fdadas', 'dfas', '2016-02-14 13:10:39', '0', '0', '<p>dfas</p>', '3', '');

-- ----------------------------
-- Table structure for t_blogger
-- ----------------------------
DROP TABLE IF EXISTS `t_blogger`;
CREATE TABLE `t_blogger` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `profile` text,
  `nickName` varchar(50) DEFAULT NULL,
  `sign` varchar(100) DEFAULT NULL,
  `imageName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_blogger
-- ----------------------------
INSERT INTO `t_blogger` VALUES ('1', 'hughjin', 'c5c9e08efa6f7886f38d2ccf909f3a1d', '<p><img src=\"http://img.baidu.com/hi/jx2/j_0009.gif\"/>&nbsp;穷屌出身，发奋图强；</p><p>&nbsp;</p><p><img src=\"http://img.baidu.com/hi/jx2/j_0003.gif\"/> 始终坚信 “知识改变命运，技术改变世界”</p><p><br/></p><p><img src=\"http://img.baidu.com/hi/jx2/j_0007.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0007.gif\"/></p><p><img src=\"http://img.baidu.com/hi/jx2/j_0007.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0007.gif\"/></p><p><img src=\"http://img.baidu.com/hi/jx2/j_0007.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0007.gif\"/></p><p><img src=\"http://img.baidu.com/hi/jx2/j_0007.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0007.gif\"/></p><p><img src=\"http://img.baidu.com/hi/jx2/j_0007.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0007.gif\"/></p><p><img src=\"http://img.baidu.com/hi/jx2/j_0007.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0007.gif\"/></p><p></p>', 'hughjin', '知识改变命运，技术改变世界', '20160202043951.jpg');

-- ----------------------------
-- Table structure for t_blogtype
-- ----------------------------
DROP TABLE IF EXISTS `t_blogtype`;
CREATE TABLE `t_blogtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(30) DEFAULT NULL,
  `orderNo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_blogtype
-- ----------------------------
INSERT INTO `t_blogtype` VALUES ('1', '人生感叹', '1');
INSERT INTO `t_blogtype` VALUES ('2', '学习类', '3');
INSERT INTO `t_blogtype` VALUES ('3', '工作类', '2');
INSERT INTO `t_blogtype` VALUES ('4', '生活类', '4');

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userIp` varchar(50) DEFAULT NULL,
  `blogId` int(11) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `commentDate` datetime DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES ('1', '1.1.1.1', '1', '测试', '2016-01-05 11:18:18', '1');
INSERT INTO `t_comment` VALUES ('2', '2.3.3.3', '1', '测试2', '2016-01-11 11:20:52', '1');
INSERT INTO `t_comment` VALUES ('5', '0:0:0:0:0:0:0:1', '2', 'sds', '2016-01-20 09:58:00', '1');
INSERT INTO `t_comment` VALUES ('6', '0:0:0:0:0:0:0:1', '2', '322', '2016-01-20 09:58:26', '1');
INSERT INTO `t_comment` VALUES ('7', '0:0:0:0:0:0:0:1', '2', '好啊', '2016-01-20 09:59:04', '1');
INSERT INTO `t_comment` VALUES ('8', '0:0:0:0:0:0:0:1', '2', '21', '2016-01-20 10:03:50', '1');
INSERT INTO `t_comment` VALUES ('9', '0:0:0:0:0:0:0:1', '2', 'sa', '2016-01-21 09:11:23', '1');
INSERT INTO `t_comment` VALUES ('10', '0:0:0:0:0:0:0:1', '2', '3329', '2016-01-21 09:11:32', '1');
INSERT INTO `t_comment` VALUES ('11', '0:0:0:0:0:0:0:1', '2', 'sds', '2016-01-21 09:11:37', '1');
INSERT INTO `t_comment` VALUES ('12', '0:0:0:0:0:0:0:1', '2', 'sds', '2016-01-21 09:11:41', '1');
INSERT INTO `t_comment` VALUES ('19', '0:0:0:0:0:0:0:1', '1', 'fda', '2016-02-02 15:54:20', '1');
INSERT INTO `t_comment` VALUES ('21', '0:0:0:0:0:0:0:1', '1', 'alert(\'1\')', '2016-02-02 21:07:55', '1');
INSERT INTO `t_comment` VALUES ('22', '0:0:0:0:0:0:0:1', '1', 'fdadddd', '2016-02-04 10:04:20', '2');
INSERT INTO `t_comment` VALUES ('23', '0:0:0:0:0:0:0:1', '1', 'fdas', '2016-02-04 10:05:10', '1');
INSERT INTO `t_comment` VALUES ('24', '0:0:0:0:0:0:0:1', '1', 'dassssssssssss', '2016-02-04 10:44:27', '1');
INSERT INTO `t_comment` VALUES ('25', '0:0:0:0:0:0:0:1', '1', 'dasdada', '2016-02-04 10:44:51', '1');
INSERT INTO `t_comment` VALUES ('26', '0:0:0:0:0:0:0:1', '1', 'fda', '2016-02-06 09:05:45', '1');
INSERT INTO `t_comment` VALUES ('27', '0:0:0:0:0:0:0:1', '1', 'fda', '2016-02-06 09:05:52', '1');
INSERT INTO `t_comment` VALUES ('28', '0:0:0:0:0:0:0:1', '1', 'fda', '2016-02-06 09:06:36', '1');
INSERT INTO `t_comment` VALUES ('29', '0:0:0:0:0:0:0:1', '1', '3232', '2016-02-06 09:06:41', '1');
INSERT INTO `t_comment` VALUES ('30', '0:0:0:0:0:0:0:1', '41', '放大', '2016-02-13 14:19:58', '1');

-- ----------------------------
-- Table structure for t_link
-- ----------------------------
DROP TABLE IF EXISTS `t_link`;
CREATE TABLE `t_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `linkName` varchar(100) DEFAULT NULL,
  `linkUrl` varchar(200) DEFAULT NULL,
  `orderNo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_link
-- ----------------------------
INSERT INTO `t_link` VALUES ('1', 'Java知识分享网', 'http://www.java1234.com/', '1');
INSERT INTO `t_link` VALUES ('2', '百度云搜索引擎', 'http://pan.java1234.com/', '2');
INSERT INTO `t_link` VALUES ('3', '小图标下载', 'http://www.easyicon.net/', '3');
INSERT INTO `t_link` VALUES ('4', 'Java贴吧', 'http://tieba.baidu.com/f?kw=java', '4');
