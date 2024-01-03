class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image(
              image: AssetImage('assets/Logo.png'),
            ),
          ],
        ),
        backgroundColor: Color(0xFF0D2C66),
        toolbarHeight: 73.0,
      ),
      body: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Version',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF0D2C66),
                fontSize: 20,
              ),
            ),
            Text(
              'App Version',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xFF0D2C66), fontSize: 20),
            ),
            Text(
              'Legal Information',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xFF0D2C66), fontSize: 20),
            ),
            Text(
              'This app is made for educational purposes. May the force Be with the users.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xFF0D2C66), fontSize: 20),
            ),
          ]),
    );
  }
}
