name "all"
description "Setup for things needed on all our servers."
run_list(
  "recipe[app::all]"
)
