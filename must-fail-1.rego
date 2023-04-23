package confluent

deny[msg] {
  msg := sprintf(
    "This plan must fail 1",
    []
  )
}
