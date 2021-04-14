<template>
  <el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
    <el-form-item label="用户名" prop="user_name">
      <el-input v-model.number="ruleForm.user_name"></el-input>
    </el-form-item>
    <el-form-item label="密码" prop="password">
      <el-input type="password" v-model="ruleForm.password" autocomplete="off"></el-input>
    </el-form-item>
    <el-form-item>
      <el-button type="primary" @click="submitForm('ruleForm')">提交</el-button>
      <el-button @click="resetForm('ruleForm')">重置</el-button>
    </el-form-item>
  </el-form>
</template>

<script>
import * as Request from "../../general/request";

export default {
  data() {
    var checkAge = (rule, value, callback) => {
      if (!value) {
        return callback(new Error('用户名不能为空'));
      }
      callback();
    };
    var validatePass = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请输入密码'));
      }
      callback();
    };
    return {
      ruleForm: {
        password: '',
        user_name: ''
      },
      rules: {
        password: [
          {validator: validatePass, trigger: 'blur'}
        ],
        user_name: [
          {validator: checkAge, trigger: 'blur'}
        ]
      }
    };
  },
  methods: {
    submitForm(formName) {
        this.$refs[formName].validate((valid) => {
          if (valid) {
            this.login()
          } else {
            console.log('error submit!!');
            return false;
          }
        });
      },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
    async login() {
      const response = await Request.POST('/background/login', this.ruleForm)
      if (response && response.data) {
        var return_data = response.data
        if (return_data.success) {
          //debugger
          this.$store.commit("mSetTokenInfo", return_data.data.access)

          // this.$router.push("/home")
          this.$router.push({
            name: "home"
            // params: {
            //   username: response.data.data.username,
            //   department: response.data.data.department
            // }
          });
          this.$message.success(return_data.msg)
        } else {
          this.$message.error(return_data.msg)
        }
      }
    }
  },
}
</script>