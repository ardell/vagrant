name "web"
description "Front end web server."
run_list(
  "recipe[app::web]"
)
