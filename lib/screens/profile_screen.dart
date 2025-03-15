import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Profile", style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {},
              child: const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    'https://placehold.co/600x400'),
              ),
            ),
            const SizedBox(height: 10),
            const Text("Change Picture",
                style: TextStyle(color: Colors.white54)),
            const SizedBox(height: 30),
            _buildTextField("Full Name", "Omar Khamis"),
            const SizedBox(height: 10),
            _buildTextField("Email", "Thephantomfxofficial@gmail.com"),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: Text("Update Profile",
                    style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 30),
            const Text("Subscription Plans",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSubscriptionCard(
                    "Basic",
                    "\$0.00 / Month",
                    [
                      "1 to 2 Trading Signals Weekly",
                      "Charts",
                      "Daily News Update",
                      "Limited Calculator Use",
                    ],
                    true),
                _buildSubscriptionCard(
                    "VIP",
                    "\$100 / Month",
                    [
                      "3 to 5 Trading Signals Daily",
                      "AI Chart Analysis",
                      "Daily News Update",
                      "Courses",
                      "Unlimited Calculator Use",
                      "Access to Forum & Telegram",
                      "Live Trading",
                    ],
                    false),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String value) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white54),
        filled: true,
        fillColor: Colors.grey[850],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      ),
      controller: TextEditingController(text: value),
    );
  }

  Widget _buildSubscriptionCard(
      String title, String price, List<String> benefits, bool isCurrent) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[850],
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: IntrinsicHeight(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text(price,
                      style:
                          const TextStyle(color: Colors.white54, fontSize: 14)),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: benefits
                        .map((b) => Text("✔️ $b",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12)))
                        .toList(),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      isCurrent ? Colors.grey[900] : Colors.grey[900],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {},
                child:
                    Text(isCurrent ? "Current Subscription" : "Subscribe Now"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
