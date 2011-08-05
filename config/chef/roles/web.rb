name "web"
description "Front end web server."
run_list(
  "role[all]",
  "recipe[app::web]"
)
