(function() {
  var style = getComputedStyle(document.documentElement);
  var accent = style.getPropertyValue('--accent').trim();
  var accent2 = style.getPropertyValue('--accent2').trim();
  var ink = style.getPropertyValue('--ink').trim();
  var muted = style.getPropertyValue('--muted').trim();
  var rule = style.getPropertyValue('--rule').trim();
  var bg2 = style.getPropertyValue('--bg2').trim();
  var green = style.getPropertyValue('--green').trim();

  // --- Chart: Feature Completion by Module ---
  var chart1 = echarts.init(document.getElementById('chart-features'), null, { renderer: 'svg' });
  chart1.setOption({
    animation: false,
    tooltip: {
      trigger: 'axis',
      axisPointer: { type: 'shadow' },
      appendToBody: true,
      textStyle: { fontSize: 13 }
    },
    legend: {
      data: ['已完成'],
      top: 5,
      textStyle: { color: muted, fontSize: 12 }
    },
    grid: { left: '3%', right: '5%', bottom: '3%', top: '15%', containLabel: true },
    xAxis: {
      type: 'category',
      data: ['PDF阅读器', '标注系统', 'AI引擎', 'Skill Hub', '文献管理', '数据管理', '国际化'],
      axisLine: { lineStyle: { color: rule } },
      axisLabel: { color: muted, fontSize: 11, interval: 0, rotate: 15 }
    },
    yAxis: {
      type: 'value',
      name: '功能数',
      nameTextStyle: { color: muted, fontSize: 12 },
      axisLine: { lineStyle: { color: rule } },
      axisLabel: { color: muted, fontSize: 11 },
      splitLine: { lineStyle: { color: rule, type: 'dashed' } }
    },
    series: [{
      name: '已完成',
      type: 'bar',
      data: [4, 4, 5, 4, 7, 3, 2],
      itemStyle: {
        color: accent,
        borderRadius: [4, 4, 0, 0]
      },
      barWidth: '45%',
      label: {
        show: true,
        position: 'top',
        color: ink,
        fontSize: 12,
        fontWeight: 600
      }
    }]
  });
  window.addEventListener('resize', function() { chart1.resize(); });
})();
