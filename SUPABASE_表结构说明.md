# Supabase messages 表：昵称与头像列

留言板会为每条留言保存 **随机昵称** 和 **DiceBear 头像地址**。若你的 `messages` 表里还没有这两列，按下面步骤添加即可。

## 1. 在 Supabase 里加列

1. 打开 [Supabase](https://supabase.com) 控制台，进入你的项目。
2. 左侧点击 **SQL Editor**。
3. 新建一个 Query，粘贴并执行下面这段 SQL：

```sql
-- 为 messages 表增加昵称、头像地址两列（若已存在会报错，可忽略或先检查列名）
alter table public.messages
  add column if not exists nickname text,
  add column if not exists avatar_url text;
```

4. 若你的 Supabase 版本不支持 `add column if not exists`，可分开执行：

```sql
alter table public.messages add column nickname text;
alter table public.messages add column avatar_url text;
```

（若提示列已存在，说明之前已经加过，无需再执行。）

## 2. 列说明

| 列名        | 类型   | 说明 |
|------------|--------|------|
| `nickname` | `text` | 随机昵称，如「可爱的火星人」「勇敢的小仓鼠」。 |
| `avatar_url` | `text` | DiceBear 头像图片 URL，根据昵称生成，同一昵称对应同一头像。 |

旧数据没有这两列时，前端会显示昵称为「神秘访客」，头像用默认占位。

## 3. 可选：给新列设默认值

若希望老数据也有占位昵称/头像，可执行（可选）：

```sql
update public.messages
set nickname = '神秘访客', avatar_url = 'https://api.dicebear.com/9.x/lorelei/svg?seed=guest'
where nickname is null or avatar_url is null;
```

完成以上步骤后，刷新留言板页面即可正常使用昵称和头像功能。
