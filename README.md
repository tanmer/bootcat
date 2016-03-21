# Bootcat(启动猫)

## Rails如何使用

    rake bootcat:install

## 加载的Gem列表

### Rails

    "rails", "~> 4.2", ">= 4.2.5.1"

### Settingslogic

    "settingslogic", "~> 2.0", ">= 2.0.9"

### Paperclip 使用方法

在config/settings.yml中配置：

    development:
      paperclip:
        enable: true
        options:
          storage: :quniu
          qiniu_credentials:
            access_key: xxx
            secret_key: sss
          bucket: tm-xxx
          use_timestamp: false
          qiniu_host: http://pic.wedxt.com


### CKEditor 使用方法

在config/settings.yml中配置：

    development:
      ckeditor:
        enable: true
        path_prefix: '/ckeditor'
          