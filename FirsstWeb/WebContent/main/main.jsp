<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style>
body {
	padding: 0;
	margin: 0;
}

#bigcontent {
	height: 900px;
	width: 100%;
}

#left {
	background-color: darkgoldenrod;
	width: 33.33%;
	height: 100%;
	float: left;
}

#center {
	background-color: royalblue;
	width: 33.33%;
	height: 100%;
	float: left;
}

#right {
	background-color: green;
	width: 33.33%;
	height: 100%;
	float: left;
}

#left-top {
	background-color: yellow;
	width: 100%;
	height: 300px;
}

#left-center {
	background-color: yellowgreen;
	width: 100%;
	height: 300px;
}

#left-bottom {
	background-color: darkcyan;
	width: 100%;
	height: 300px;
}

h1 {
	padding: 0;
	margin: 0;
}
</style>
</head>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/echarts.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<body>


	<div id="bigcontent">
		<h1 style="background: blue; text-align: center;">基于大数据的电影分析结果可视化</h1>
		<div id="left">
			<div id="left-top"></div>
			<div id="left-center"></div>
			<div id="left-bottom"></div>
		</div>
		<div id="center"></div>
		<div id="right"></div>

	</div>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<!-- <div id="main" style="width: 600px;height:400px;"></div>-->
	<!--第一：基于商品销量的柱状图可视化展示 -->
	 <script type="text/javascript">
       var myChart1 = echarts.init(document.getElementById('left-top'));
        // 显示标题，图例和空的坐标轴
        option = {
    tooltip: {
        trigger: 'axis'
    },
    legend: {
        data: ['邮件营销', '联盟广告', '视频广告', '直接访问', '搜索引擎']
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    toolbox: {
        feature: {
            saveAsImage: {}
        }
    },
    xAxis: {
        type: 'category',
        boundaryGap: false,
        data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
    },
    yAxis: {
        type: 'value'
    },
    series: [
        {
            name: '邮件营销',
            type: 'line',
            stack: '总量',
            data: [120, 132, 101, 134, 90, 230, 210]
        },
        {
            name: '联盟广告',
            type: 'line',
            stack: '总量',
            data: [220, 182, 191, 234, 290, 330, 310]
        },
        {
            name: '视频广告',
            type: 'line',
            stack: '总量',
            data: [150, 232, 201, 154, 190, 330, 410]
        },
        {
            name: '直接访问',
            type: 'line',
            stack: '总量',
            data: [320, 332, 301, 334, 390, 330, 320]
        },
        {
            name: '搜索引擎',
            type: 'line',
            stack: '总量',
            data: [820, 932, 901, 934, 1290, 1330, 1320]
        }
    ]
};
      myChart1.setOption(option);

    </script>

	<script type="text/javascript">
		// 基于准备好的dom，初始化echarts实例
		
		var myChartpie = echarts.init(document.getElementById('right'), 'dark');
		myChartpie.setOption({
			    title: {
			        text: '某站点用户访问来源',
			        subtext: '纯属虚构',
			        left: 'center'
			    },
			    tooltip: {
			        trigger: 'item',
			        formatter: '{a} <br/>{b} : {c} ({d}%)'
			    },
			    legend: {
			        orient: 'vertical',
			        left: 'left',
			        data: []
			    },
			    series: [
			        {
			            name: '访问来源',
			            type: 'pie',
			            radius: '55%',
			            center: ['50%', '60%'],
			            data: [],
			            emphasis: {
			                itemStyle: {
			                    shadowBlur: 10,
			                    shadowOffsetX: 0,
			                    shadowColor: 'rgba(0, 0, 0, 0.5)'
			                }
			            }
			        }
			    ]
			});
		myChartpie.showLoading();
        // 异步加载数据  $  jQuery
        $.get('${pageContext.request.contextPath}/EmpServlet?param=pie').done(function (data) {
        	myChartpie.hideLoading();
        	console.log(data)
           var data =$.parseJSON(data);
           console.log(data)
   			 var ename=[]
   			 var qwe=[]
   			 
   			 for(i=0;i<data.length;i++){
   				 
   				 ename[i] = data[i].name;
   				 qwe[i] = {value: data[i].value, name: data[i].name};
   			 }
   			console.log(ename)
   			
            // 填入数据
            myChartpie.setOption({
            	legend: {
			        orient: 'vertical',
			        left: 'left',
			        data: ename
			    },
			    series: [
			        {
			            name: '访问来源',
			            type: 'pie',
			            radius: '55%',
			            center: ['50%', '60%'],
			            data: qwe,
			            emphasis: {
			                itemStyle: {
			                    shadowBlur: 10,
			                    shadowOffsetX: 0,
			                    shadowColor: 'rgba(0, 0, 0, 0.5)'
			                }
			            }
			        }
			    ]
            });
        });
		// 使用刚指定的配置项和数据显示图表。
		//myChartpie.setOption(option);

		
		
	</script>

	<script type="text/javascript">
		// 基于准备好的dom，初始化echarts实例
		var myChartline = echarts.init(document.getElementById('left-center'));
		
		myChartline.setOption({
			xAxis: {
		        type: 'category',
		        data: []
		    },
		    yAxis: {
		        type: 'value'
		    },
		    series: [{
		        data: [],
		        type: 'line'
		    }]
        });
        myChartline.showLoading();
        // 异步加载数据  $  jQuery
        $.get('${pageContext.request.contextPath}/EmpServlet?param=line').done(function (data) {
        	myChartline.hideLoading();
       // alert(data)
       // console.log(data[0]);
           var data =$.parseJSON(data);
           //console.log(typeof(data));
   			 //console.log(data[0]);
   			
   			 var year=[]
   			 var score=[]
   			 //console.log(data.length)
   			 for(i=0;i<data.length;i++){
   				 console.log(i)
   				 year[i] = data[i].year;
   				 score[i] = data[i].score;
   			 }
   			console.log(year)
   			console.log(score)
            // 填入数据
            myChartline.setOption({
            	xAxis: {
    		        type: 'category',
    		        data: year
    		    },
    		    yAxis: {
    		        type: 'value'
    		    },
    		    series: [{
    		        data: score,
    		        type: 'line'
    		    }]
            });
        });
        
		


		// 使用刚指定的配置项和数据显示图表。
		//myChartline.setOption(option);
	</script>
	<script type="text/javascript">
		// 基于准备好的dom，初始化echarts实例
		var myChart3 = echarts.init(document.getElementById('center'));
		option = {
			    tooltip: {},
			    legend: {
			        data: ['预算分配（Allocated Budget）']
			    },
			    radar: {
			        // shape: 'circle',
			        name: {
			            textStyle: {
			                color: '#fff',
			                backgroundColor: '#999',
			                borderRadius: 3,
			                padding: [3, 5]
			            }
			        },
			        indicator: [
			            { name: '销售（sales）', max: 6500},
			            { name: '管理（Administration）', max: 16000},
			            { name: '信息技术（Information Techology）', max: 30000},
			            { name: '客服（Customer Support）', max: 38000},
			            { name: '研发（Development）', max: 52000},
			            { name: '市场（Marketing）', max: 25000}
			        ]
			    },
			    series: [{
			        name: '预算 vs 开销（Budget vs spending）',
			        type: 'radar',
			        // areaStyle: {normal: {}},
			        data: [
			            {
			                value: [4300, 10000, 28000, 35000, 50000, 19000],
			                name: '预算分配（Allocated Budget）'
			            }
			            
			        ]
			    }]
			};

		// 使用刚指定的配置项和数据显示图表。
		myChart3.setOption(option);
	</script>
	<script type="text/javascript">
		// 基于准备好的dom，初始化echarts实例
		var myChart4 = echarts.init(document.getElementById('left-bottom'));
		var hours = ['2010', '2011', '2012', '2013', '2014', '2015', '2016',
	        '2017', '2018', '2019','2020'];
	var days = ['one', 'two', 'three',
	        'four', 'five', 'six', 'seven'];

	var data = [[0,0,5],[0,1,1],[0,2,0],[0,3,0],[0,4,0],[0,5,0],[0,6,0],[0,7,0],[0,8,0],[0,9,0],[0,10,0],[1,0,7],[1,1,0],[1,2,0],[1,3,0],[1,4,0],[1,5,0],[1,6,0],[1,7,0],[1,8,0],[1,9,0],[1,10,5],[2,0,1],[2,1,1],[2,2,0],[2,3,0],[2,4,0],[2,5,0],[2,6,0],[2,7,0],[2,8,0],[2,9,0],[2,10,3],[3,0,7],[3,1,3],[3,2,0],[3,3,0],[3,4,0],[3,5,0],[3,6,0],[3,7,0],[3,8,1],[3,9,0],[3,10,5],[4,0,1],[4,1,3],[4,2,0],[4,3,0],[4,4,0],[4,5,1],[4,6,0],[4,7,0],[4,8,0],[4,9,2],[4,10,4],[5,0,2],[5,1,1],[5,2,0],[5,3,3],[5,4,0],[5,5,0],[5,6,0],[5,7,0],[5,8,2],[5,9,0],[5,10,4],[6,0,1],[6,1,0],[6,2,0],[6,3,0],[6,4,0],[6,5,0],[6,6,0],[6,7,0],[6,8,0],[6,9,0],[6,10,1]];

	data = data.map(function (item) {
	    return [item[1], item[0], item[2] || '-'];
	});

	option = {
	    tooltip: {
	        position: 'top'
	    },
	    animation: false,
	    grid: {
	        height: '50%',
	        top: '10%'
	    },
	    xAxis: {
	        type: 'category',
	        data: hours,
	        splitArea: {
	            show: true
	        }
	    },
	    yAxis: {
	        type: 'category',
	        data: days,
	        splitArea: {
	            show: true
	        }
	    },
	    visualMap: {
	        min: 0,
	        max: 10,
	        calculable: true,
	        orient: 'horizontal',
	        left: 'center',
	        bottom: '15%'
	    },
	    series: [{
	        name: 'Punch Card',
	        type: 'heatmap',
	        data: data,
	        label: {
	            show: true
	        },
	        emphasis: {
	            itemStyle: {
	                shadowBlur: 10,
	                shadowColor: 'rgba(0, 0, 0, 0.5)'
	            }
	        }
	    }]
	};

		// 使用刚指定的配置项和数据显示图表。
		myChart4.setOption(option);
	</script>
</body>
</html>
