Get-ChildItem -Filter *.md -Recurse | ForEach-Object {
    (Get-Content $_.FullName) -match '^#' | Set-Content $_.FullName
}