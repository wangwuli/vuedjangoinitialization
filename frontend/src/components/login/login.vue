<template>
  <el-container :style='{height: this.client_adjust + "px"}'>
    <el-aside width="400px">
<!--        <img src="https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png" class="image">-->
      <el-card class="box-card" :style='{"padding-top": this.client_adjust_half + "px"}'>
        <el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm"
                 size="mini">
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
      </el-card>
    </el-aside>
    <el-main>Main</el-main>
  </el-container>
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
      client_adjust: 0,
      clientW: document.documentElement.clientWidth,
      clientH: document.documentElement.clientHeight,
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
  created () {
    this.client_adjust = this.clientH - 30
    this.client_adjust_half = this.clientH * 0.5
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
          debugger
          this.$store.commit("mSetTokenInfo", return_data.data.access)
          this.$store.commit("setUserinfo", return_data.data.userinfo)

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

<style>
  .text {
    font-size: 14px;
  }

  .item {
    padding: 18px 0;
  }

  .box-card {
    width: 90%;
    padding-left: 20px;
  }
</style>