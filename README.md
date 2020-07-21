### 一、简介

这是一个基于git封装的版本管理工具.

**展示帮助信息：**
![](https://github.com/Pf-G/develop-tools/blob/master/assets/img/dkgit-help.png)

**使用示例：**

![](https://github.com/Pf-G/develop-tools/blob/master/assets/img/dkgit-show.png)



### 二、使用

**分支发布(deploy)：**

| 选项 | 含义    | 说明                                                  | 示例              |
| --   | --      | --                                                    | --                |
| -d   | develop | 将功能功能分支同步主干后合并到develop并推送至远程仓库 | `dkgit deploy -d` |
| -p   | preview | 将功能分支同步主干后合并到preview并推送至远程仓库     | `dkgit deploy -p` |
| -r   | release | 将功能分支同步主干后合并到master并推送至远程仓库      | `dkgit deploy -r` |

**其他功能：**

| 功能               | 说明                                                                                                                                      |
| --                 | --                                                                                                                                        |
| 分支对齐(clean)    | 将功能分支强制和主干对齐,相当于: `git fetch && git reset origin/master --hard` <br>  使用示例:`dkgit clean`                               |
| 同步主干(sync)     | 在功能分支同步origin/master, 等价于：`git fetch && git rebase -i origin/master` <br>  使用示例：`dkgit sync`                              |
| 切换分支(checkout) | 切换或创建一个新的分支..注意，此处是强制切换到origin/master，注意及时提交代码，避免丢失. <br>  使用示例: `dkgit checkout -b  branch_name` |
| 提交修改(commit)   | 提交本地修改，并push到远程分支. <br>   使用示例: `dkgit commit -m 'commit message'`                                                       |
| 提交修改(review)   | 查看本地修改状态. <br>   使用示例: `dkgit review -b develop`                                                                              |

| 参数 | 说明                 | 示例                               |
| --   | --                   | --                                 |
| -m   | 指定commit的提交信息 | `dkgit commit -m 'commit message'` |
| -b   | 指定checkout的分支名 | `dkgit checkout -b branch_name`    |

**安装：**

拷贝一个副本，然后将该项目加入环境变量.

```bash
git clone git@v9.git.n.xiaomi.com:duokan_op/git_tool.git
```

**示例：**

```bash
# 将功能分支发布到develop分支
dkgit deploy -d

# 将功能分支发布到preview分支
dkgit deploy -p

# 将功能分支发布到master分支
dkgit deploy -r

# 将develop分支强制和master对齐
dkgit clean

# 将preview分支强制和master对齐
dkgit clean

# 强制检出到 origin/DK-xxx , 若该分支不存在，会创建新分支...
dkgit checkout -b branch_name

# 更新主干
dkgit sync

# 提交本地修改并push到远程分支
dkgit commit -m 'commit message'
```
