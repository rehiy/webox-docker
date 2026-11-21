# Webox 版本检查

检查日期：2026-11-21。范围：15 个 Docker 构建目录、19 个 Docker Hub 标签（含别名）、对应的 webox-alpine 安装组件。基准为主线提交 `bab172706e31c019c19abd3bc4b864b4d35a1eb7`。

## 发布结论

1. 优先补发 `latest` 和 `edge`。Docker Hub 的两个标签最后更新时间均为 2025-11-16；GitHub 对应工作流为 active，但运行列表为空。主线源码升级不能视为镜像已发布。未查明未触发原因，需手动运行工作流并核对 registry digest、实际组件版本和健康检查结果。
2. PHP 8.3 应迁移至 Alpine 3.24，以获得 8.3.37；Alpine 3.23 当前仍提供 8.3.36。PHP 8.4/8.5 的基础分支已合适，保持同分支补丁更新。
3. 修复 PHP 5.6 构建组件名：部署脚本应选择安装目录 `php5`。这是历史标签的构建修复，不代表恢复安全维护。
4. PHP 8.6 正式发布已具备上游条件，但 Alpine 包仍在 edge/testing，ARMv7 还是 RC。暂不增加与现有三架构承诺相同的正式 `nginx-php8.6` 标签。若确有兼容性测试需求，可单独增加仅 amd64/arm64 的 `nginx-php8.6-testing`，不移动默认别名。
5. 应补充稳定渠道和可追溯的发布快照。建议 `stable` 指向通过验证的完整 LNMP；快照标签采用 `<版本>-<构建号>`，发布后不覆盖；部署同时记录 digest。未实现不覆盖检查前，不能把普通版本标签称为不可变镜像。

## 构建目录逐项检查

以下为检查时主线基础镜像和 x86_64 APKINDEX 的版本，不是已发布镜像内部的实测清单。

| 构建标签 | Alpine | 可安装的主要组件 | 处理意见 |
|---|---|---|---|
| `latest` | 3.24 | Nginx 1.30.7、PHP 8.5.13、MariaDB 11.8.10、Redis 8.8.0 | 版本组合保留，补发并验证实际镜像 |
| `edge` | edge | Nginx 1.30.7、PHP 8.5.13、MariaDB 11.8.10、Redis 8.8.1 | 保留滚动试验用途，补发 |
| `nginx-php8.5` | 3.24 | PHP 8.5.13、Nginx 1.30.7 | 继续维护；默认 `nginx-php` / `nginx-php8` 保持指向此标签 |
| `nginx-php8.4` | 3.24 | PHP 8.4.28、Nginx 1.30.7 | 继续维护补丁 |
| `nginx-php8.3` | 3.23 | PHP 8.3.36、Nginx 1.28.3 | 升级至 3.24：PHP 8.3.37、Nginx 1.30.7 |
| `nginx-php8.2` | 3.22 | PHP 8.2.35、Nginx 1.28.3 | 上游已有 8.2.36，但当前稳定基础仓库尚未提供；不要混入 edge/testing，安排退出维护 |
| `nginx-php8.1` | 3.19 | PHP 8.1.34、Nginx 1.24.0 | PHP 已 EOL，仅历史兼容 |
| `nginx-php8.0` | 3.16 | PHP 8.0.30、Nginx 1.22.1 | PHP 已 EOL，仅历史兼容 |
| `nginx-php7.4` | 3.15 | PHP 7.4.33、Nginx 1.20.2 | PHP 已 EOL，仅历史兼容 |
| `nginx-php7.3` | 3.12 | PHP 7.3.33、Nginx 1.18.0 | PHP 已 EOL，仅历史兼容 |
| `nginx-php5.6` | 3.8 | PHP 5.6.40、Nginx 1.14.2 | 修复 `php5.6` → `php5`；PHP 已 EOL，仅历史兼容 |
| `legal-php7` | 3.15 | PHP 7.4.33、Nginx 1.20.2、MariaDB 10.6.14、Redis 6.2.18 | PHP、MariaDB 和基础发行版已过维护期，保留兼容，不作为生产推荐 |
| `nginx` | edge | Nginx 1.30.7 | 现有标签继续滚动；如有稳定部署需求，增加基于 Alpine 3.24 的 `nginx-stable` |
| `nginx-geoip` | edge | Nginx 1.30.7、GeoIP2 模块 | 同上；稳定变体应单独验证动态模块 ABI 和数据库更新 |
| `slim` | edge | BusyBox/crond、wkit | 有稳定部署需求时增加 `slim-stable`，无需增加 PHP 或数据库组件 |

各标签的补丁号由 Alpine 仓库决定。APK 的 `-rN` 可能包含发行版补丁，不能仅按上游版本字符串判断是否修复漏洞；应结合 Alpine secdb、实际安装版本和受影响模块验证。

## 上游版本和发行版版本

| 组件 | 上游可用版本 | Webox 稳定基础仓库 | 决策 |
|---|---|---|---|
| Alpine | 稳定版 3.24.4；3.25 尚未正式发布 | `alpine:3.24` | 保持稳定分支，不能因镜像目录已存在就认定 3.25 已 GA |
| Nginx | 稳定 1.30.7；mainline 1.31.9 | 1.30.7-r0 | 已跟上稳定版，无需单独编译 mainline |
| PHP | 8.6.0；8.5.13；8.4.28；8.3.37；8.2.36 | 3.24 提供 8.3.37/8.4.28/8.5.13；3.22 提供 8.2.35 | 更新 8.3 基础分支；8.6 保持独立试验用途 |
| MariaDB | 新 LTS 12.3.4；11.8 维护版 11.8.10 | 11.8.10-r0 | 11.8 仍受支持，保持此 LTS；12.3 涉及数据升级，另设迁移验证后再定版本 |
| Redis | 8.10.3；8.8 分支仍受支持 | 8.8.0-r0；edge 为 8.8.1-r0 | 追踪发行版补丁；不为追逐上游版本向稳定镜像混装 edge 包 |

## PHP 8.6 发布条件

按 PHP 8.5 当前安装脚本的扩展列表映射检查 APKINDEX，三架构都能找到对应扩展名称；包名存在不等于 ABI、依赖求解及运行验证通过。

| Docker 架构 | Alpine 架构 | edge/testing 的 PHP 8.6 包 | 当前判断 |
|---|---|---|---|
| amd64 | x86_64 | 8.6.0-r0 | 可准备试验构建，需要完整集成测试 |
| arm64 | aarch64 | 8.6.0-r0 | 可准备试验构建，需要完整集成测试 |
| arm/v7 | armv7 | 8.6.0_rc5-r1 | 仍为预发布包，不应与 GA 产物组成正式多架构标签 |

新增正式标签的条件：目标 Alpine 分支正式支持 PHP 8.6、全部目标架构为 GA 包、扩展依赖可解、FPM/CLI/Redis 扩展/数据库驱动测试通过。现有默认 PHP 8.5 别名不随新标签自动切换。

## 支持期限

| PHP 分支 | 官方安全支持截止 |
|---|---|
| 8.6 | 2030-12-31 |
| 8.5 | 2029-12-31 |
| 8.4 | 2028-12-31 |
| 8.3 | 2027-12-31 |
| 8.2 | 2026-12-31 |
| 8.1 及以下 | 已结束 |

PHP 上游仍支持不代表旧 Alpine 的 community 仓库持续享有相同支持。Alpine 当前仅 3.24 列为 main 和 community 同时支持；3.23/3.22 列为 main。PHP 包属于 community，需随基础发行版滚动维护。

## 发布完整性要求

- 所有 15 个构建目录进入 PR 的三架构构建检查，包含历史兼容标签；构建成功不等于恢复上游安全维护。
- 受维护标签定期无缓存或刷新基础镜像重建，并检查安装包版本；仅有源码 push 触发不能覆盖上游包更新。
- 每次发布保存源提交、webox-alpine 源提交、基础镜像 digest、目标架构、APK 包清单和产物 digest，避免相同源码因远端 master 和软件仓库变化而无法复现。
- 发布后验证 Docker Hub 标签更新时间与 digest，并对实际产物执行服务测试。已有数据目录的升级与恢复另行验证。
- PHP 8.2 应在 2026-12-31 后降为历史兼容；不再补齐已经 EOL 的 PHP 7.0/7.1/7.2 发布线。

## 数据来源

- [PHP 支持周期](https://www.php.net/supported-versions.php)、[已结束支持的 PHP 分支](https://www.php.net/eol.php)、[PHP 8.6 公告](https://www.php.net/releases/8_6_0.php)、[PHP 下载](https://www.php.net/downloads.php)
- [Alpine 发行分支](https://www.alpinelinux.org/releases/)、[Alpine 下载](https://www.alpinelinux.org/downloads/)
- 对各基础分支读取 `https://dl-cdn.alpinelinux.org/alpine/<branch>/<repo>/<arch>/APKINDEX.tar.gz`；额外核对 3.24 和 edge/testing 的 x86_64、aarch64、armv7 包索引
- [PHP 8.6 ARMv7 索引](https://dl-cdn.alpinelinux.org/alpine/edge/testing/armv7/)、[Alpine secdb](https://secdb.alpinelinux.org/)
- [Nginx 下载](https://nginx.org/en/download.html)、[MariaDB 2026 Q4 维护公告](https://mariadb.org/mariadb-server-12-3-11-8-11-4-and-10-11-q4-2026-maintenance-releases/)、[Redis 8.10.3](https://github.com/redis/redis/releases/tag/8.10.3)、[Redis 版本支持](https://redis.io/docs/latest/operate/oss_and_stack/install/version-mgmt/)
- [Docker Hub 标签 API](https://hub.docker.com/v2/repositories/rehiy/webox/tags?page_size=100)、[GitHub Actions](https://github.com/rehiy/webox-docker/actions)、[PHP 5.6 构建失败](https://github.com/rehiy/webox-docker/actions/runs/44890905217)
