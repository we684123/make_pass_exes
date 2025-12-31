# make_pass_exes

做出沒有用、一閃而過的 exe, 然後你可以將 `./output_pass_exes/` 納入環境變數，這樣就不會再出現沒有此命令的警告了。  

Make an exe that does nothing and closes immediately, you can add `./output_pass_exes` to your PATH to avoid "command not found" warnings.

## Requirements

[Requires gcc for compilation](https://www.msys2.org/)

## Getting Started

```bash
git clone
```

```bash
cd make_pass_exes
```

### Usage

```bash
chmod +x make_pass_exes.sh
./make_pass_exes.sh
```

or

```bat
execute make_pass_exes.bat in Windows.
```
