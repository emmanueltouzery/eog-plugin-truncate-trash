if [ ! -d bin ]; then
    virtualenv .
fi
source bin/activate
if [ ! -f bin/hy2py ]; then
    pip install git+https://github.com/hylang/hy.git
fi
mkdir -p ~/.local/share/eog/plugins
hy2py lib_truncate_trash.hy > lib_truncate_trash.py
cp lib_truncate_trash.py ~/.local/share/eog/plugins
cp truncate_trash.plugin ~/.local/share/eog/plugins
