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
        <el-button type="primary" size="mini">新增环境</el-button>
        <el-button type="primary" size="mini">编辑环境</el-button>
        <el-button type="primary" size="mini">删除环境</el-button>
        <el-button type="primary" size="mini">新增主机</el-button>
        <el-button type="primary" size="mini">编辑主机</el-button>
        <el-button type="primary" size="mini">删除主机</el-button>
        <el-button type="primary" size="mini">新增软件</el-button>
        <el-button type="primary" size="mini">编辑软件</el-button>
        <el-button type="primary" size="mini">删除软件</el-button>
      </el-header>
      <el-main>
        <el-table
            highlight-current-row
            row-style="height:20px"
            cell-style="padding:0"
            :data="tableData1"
            style="font-size: 10px; width: 100%">
          <el-table-column type="expand">
            <template #default="props">
              <el-table
                  row-style="height:20px"
                  cell-style="padding:0"
                  :data="props.row.software_data"
                  style="width: 100%; font-size: 10px">
                <el-table-column
                    prop="software_name"
                    label="软件名称"
                    width="180">
                </el-table-column>
                <el-table-column
                    prop="software_type"
                    label="软件类型"
                    width="180">
                </el-table-column>
                <el-table-column label="操作">
                  <template #default="scope">
                    <el-button
                        size="mini"
                        @click="handleEdit(scope.$index, scope.row)">编辑
                    </el-button>
                    <el-button
                        size="mini"
                        type="danger"
                        @click="handleDelete(scope.$index, scope.row)">删除
                    </el-button>
                  </template>
                </el-table-column>
              </el-table>
            </template>
          </el-table-column>
          <el-table-column
              label="服务器名称"
              prop="name">
          </el-table-column>
          <el-table-column
              label="服务器IP"
              prop="date">
          </el-table-column>
          <el-table-column
              label="备注"
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
        id: 1,
        date: '192.168.1.1',
        name: '应用部署服务器',
        other: '其他信息',
        software_data: [{
          "software_name": "redis",
          "software_type": "容器"
        },
        {
          "software_name": "mysql",
          "software_type": "容器"
        }
        ]
      }, {
        id: 2,
        date: '192.168.1.2',
        name: 'mYSQL服务器',
        other: '其他信息',
        software_data: []
      }, {
        id: 3,
        date: '192.168.1.3',
        name: 'Redis',
        other: '其他信息',
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