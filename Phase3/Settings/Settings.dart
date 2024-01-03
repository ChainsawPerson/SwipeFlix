class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image(
              image: AssetImage('assets/Logo.png'),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF0D2C66),
        toolbarHeight: 73.0,
      ),
      body: Align(
          alignment: Alignment.topCenter,
          child: PopupMenuButton(
            onSelected: (value) {
              if (value == 'Settings & Privacy') {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => DLMode()));
              } else if (value == 'About') {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => About()));
              }
            },
            offset: Offset(-25, 80),
            color: Colors.black,
            icon: Image.asset('assets/Icon button-darkSettings.png'),
            iconSize: 100,
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'Settings & Privacy',
                child: Text(
                  'Settings & Privacy',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const PopupMenuItem(
                value: 'About',
                child: Text(
                  'About',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          )),
    );
  }
}
