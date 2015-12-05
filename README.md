#2015年12月5号重建工程。新体系改写部分Material文件具体修改参见下表
# 修改过文件整理  
	dialog.qml
	MenuField.qml  
	TextFieldStyle.qml
Action.qml 加入 Action 支持label
	加入 property bool hasText:false 属性
IconButton.qml 支持label
	iconButton 加入width:icon.width>label.width? icon.width:label.width
	icon 加入 visible:!action.hasText
	新加入label
     Label{
	id: label
	anchors.centerIn: parent
	visible:action.hasText
	text:action.text
	color:iconButton.color
	style:"subheading"
       }
ActionBar.qml 支持下拉菜单颜色与标题统一	
	iconAction下
	spacing: Units.dp(8)
 	size: Units.dp(27)//iconSource == "icon://content/add" ? Units.dp(27) : Units.dp(24)
	overflowMenu下添加
	color:actionBar.backgroundColor
        textColor: Theme.lightDark(actionBar.backgroundColor,Theme.light.textColor,Theme.dark.textColor)	
	iconColor: Theme.lightDark(actionBar.backgroundColor, Theme.light.iconColor,Theme.dark.iconColor)	
DatePicker.qml 问题 无法显示 周？ 
	92行
	text: control.__locale.dayName(styleData.dayOfWeek, Locale.NarrowFormat).substring(0, 4)
TabBar.qml   问题汉字tab标题过小
	177行
	style: "subheading"
Label.qml   问题整体汉字偏小 
	112行
	 font.pixelSize: !Device.isMobile && fontInfo.size_desktop 
            ? fontInfo.size_desktop : fontInfo.size
BaseListItem.qml
	tintColor: selected
               ? Qt.rgba(0,0,0,0.1)
               : ink.containsMouse ? Qt.rgba(0,0,0,0.08) : Qt.rgba(0,0,0,0)
Subheader.qml
	color: Theme.lightDark(listItem.backgroundColor,Theme.light.subTextColor,Theme.dark.subTextColor)
Standard.qml
	icon下
	size: Units.dp(27)
Dropdown.qml
	property color color;
	View下添加
	backgroundColor:color
