<template>
    <el-containe>
        <el-aside width="200px">
            <el-card class="box-card">
                <el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm" label-width="100px"
                         class="demo-ruleForm" size="mini">
                    <el-form-item label="密码" prop="pass">
                        <el-input v-model.number="ruleForm.username"></el-input>
                    </el-form-item>
                    <el-form-item label="确认密码" prop="checkPass">
                        <el-input type="password" v-model="ruleForm.password" autocomplete="off"></el-input>
                    </el-form-item>
                    <el-form-item>
                        <el-button type="primary" @click="submitForm('ruleForm')">提交</el-button>
                        <el-button @click="resetForm('ruleForm')">重置</el-button>
                    </el-form-item>
                </el-form>
            </el-card>
        </el-aside>
        <el-main>
        </el-main>
    </el-containe>
</template>

<script>
import { defineComponent, ref } from 'vue'

export default defineComponent ({
  setup() {
    return {
        ruleForm: {
          username: '',
          password: ref('')
        }
    }
  },
    methods: {
        submitForm(formName) {
            this.$refs[formName].validate((valid) => {
                if (valid) {
                    alert('submit!');
                } else {
                    console.log('error submit!!');
                    return false;
                }
            });
        },
        resetForm(formName) {
            this.$refs[formName].resetFields();
        }
    }
})
</script>

<style scoped>

</style>
