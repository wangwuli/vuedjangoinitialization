<template>
  <el-container>
    <el-aside width="250px">
      <el-table
          row-style="height:20px"
          cell-style="padding:0"
          style="font-size: 10px; width: 90%"
          :data="tableData"
          :row-class-name="tableRowClassName">
        <el-table-column
            show-overflow-tooltip
            prop="env_name"
            label="环境名">
        </el-table-column>
        <el-table-column
            width="50px"
            show-overflow-tooltip
            prop="type"
            label="类型">
        </el-table-column>
        <el-table-column
            show-overflow-tooltip
            prop="comments"
            label="备注">
        </el-table-column>
      </el-table>
    </el-aside>
    <el-container>
      <el-header style="font-size: 12px; width: 100%">
        <el-button type="primary" size="mini">安装</el-button>
        <el-button type="primary" size="mini">配置调整</el-button>
        <el-button type="primary" size="mini">日志查看</el-button>
        <el-button type="primary" size="mini">重启</el-button>
        <el-button type="primary" size="mini">停止</el-button>
        <el-button type="primary" size="mini">销毁</el-button>
      </el-header>
      <el-main>
        <el-table
            highlight-current-row
            row-style="height:20px"
            cell-style="padding:0"
            :data="tableData1"
            style="font-size: 10px; width: 100%">
          <el-table-column
              label="软件名称"
              prop="id">
          </el-table-column>
          <el-table-column
              label="软件类型"
              prop="name">
          </el-table-column>
          <el-table-column
              label="部署方式"
              prop="dep">
          </el-table-column>
          <el-table-column
              label="部署状态"
              prop="desc">
          </el-table-column>
        </el-table>
      </el-main>
    </el-container>
  </el-container>
</template>

<script>
export default {
  name: "resource_management",
  data() {
    return {
      tableData: [{
        env_name: '航之寓',
        type: '生产',
        comments: '阿里云',
      }, {
        env_name: '菲寓',
        ype: '生产',
        comments: '阿里云',
      }, {
        env_name: '菲寓测试',
        ype: '测试',
        comments: '机房',
      }, {
        env_name: '航之寓dev',
        ype: '开发',
        comments: '机房',
      }],
      tableData1: [{
        id: "redis",
        date: '192.168.1.1',
        name: '容器',
        other: '其他信息',
        dep: "平台镜像",
        software_data: []
      }, {
        id: "tomcat",
        date: '192.168.1.2',
        name: '容器',
        other: '其他信息',
        dep: "镜像库",
        software_data: []
      }, {
        id: "nginx",
        date: '192.168.1.3',
        name: '容器',
        other: '其他信息',
        dep: "服务器本地镜像",
        software_data: []
      }]
    }
  },
  methods: {
  }
}
</script>

<style scoped>
.el-table .warning-row {
  background: oldlace;
}

.el-table .success-row {
  background: #f0f9eb;
}
</style>