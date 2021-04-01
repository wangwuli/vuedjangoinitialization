<template>
  <el-row>
    <el-col :span="11">
      <el-card class="box-card" shadow="hover">
        <template #header>
          <div class="card-header">
            <span>应用仓库配置</span>
            <el-button type="primary" @click="onSubmit" size="mini">保存</el-button>
          </div>
        </template>
        <el-form ref="form" :model="form" size="mini" label-width="80px">
          <el-form-item label="url">
            <el-input v-model="form.name" style="width: 400px"></el-input>
          </el-form-item>
          <el-form-item label="用户名">
            <el-input v-model="form.name" style="width: 400px"></el-input>
          </el-form-item>
          <el-form-item label="密码">
            <el-input v-model="form.name" style="width: 400px"></el-input>
          </el-form-item>
          <el-form-item label="库类型">
            <el-select v-model="form.region" placeholder="请选择">
              <el-option label="nexus" value="shanghai"></el-option>
              <el-option label="阿里云" value="beijing"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="启用">
            <el-switch v-model="form.delivery"></el-switch>
          </el-form-item>
        </el-form>
      </el-card>
    </el-col>
    <el-col :span="11" :offset="2">
      <el-card class="box-card" shadow="hover">
        <template #header>
          <div class="card-header">
            <span>镜像仓库配置</span>
            <el-button type="primary" @click="onSubmit" size="mini">保存</el-button>
          </div>
        </template>
        <el-form ref="form" :model="form" size="mini" label-width="80px">
          <el-form-item label="url">
            <el-input v-model="form.name" style="width: 400px"></el-input>
          </el-form-item>
          <el-form-item label="用户名">
            <el-input v-model="form.name" style="width: 400px"></el-input>
          </el-form-item>
          <el-form-item label="密码">
            <el-input v-model="form.name" style="width: 400px"></el-input>
          </el-form-item>
          <el-form-item label="库类型">
            <el-select v-model="form.region" placeholder="请选择">
              <el-option label="Harbor" value="shanghai"></el-option>
              <el-option label="阿里云" value="beijing"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="启用">
            <el-switch v-model="form.delivery"></el-switch>
          </el-form-item>
        </el-form>
      </el-card>
    </el-col>
  </el-row>
</template>

<script>
export default {
  data() {
    return {
      form: {
        name: '',
        region: '',
        date1: '',
        date2: '',
        delivery: false,
        type: [],
        resource: '',
        desc: ''
      }
    }
  },
  methods: {
    onSubmit() {
      console.log('submit!');
    }
  }
}
</script>

<style scoped>
.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.text {
  font-size: 14px;
}

.item {
  margin-bottom: 18px;
}

.box-card {
  width: 100%;
}
</style>