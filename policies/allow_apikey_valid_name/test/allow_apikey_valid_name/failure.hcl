mock "tfplan/v2" {
  module {
    source = "../../testdata/mock-tfplan-failure.sentinel"
  }
}

test {
  rules = {
    main_fail = true
    main = false
  }
}
