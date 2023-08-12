import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class FAQPage extends StatelessWidget {
  final List<QuestionAnswerPair> faqData = [
    QuestionAnswerPair(
      question: '1. What is consciousleap?',
      answer:
      'consciousleap is a mindful online service provider of mental health-related services for adolescents, adults, couples, and families via Tele-Therapy. We also give businesses mindful insights on mental health-related support services. In addition to the above, consciousleap hosts a mindful Conscious Store where we only cater to sourcing and providing locally produced, organic, environmentally friendly, sustainable goods.',
    ),
    QuestionAnswerPair(
      question: '2. How does it work?',
      answer:
      'Flutter uses the Dart programming language and provides a rich set of pre-designed widgets and tools for building user interfaces. It includes a rendering engine to display the widgets on the screen and a hot-reload feature for rapid development.',
    ),
    QuestionAnswerPair(
      question: '3. Where is consciousleap based?',
      answer:
      'consciousleap is currently based in Estonia and India.',
    ),
    QuestionAnswerPair(
      question: '4. What are the qualifications and credentials of the therapists?',
      answer:
      'Our therapists at consciousleap are highly qualified professionals with relevant degrees and certifications in their respective fields. They have undergone rigorous training and possess expertise in various therapeutic approaches. We ensure that our therapists meet the necessary licensing requirements and maintain ethical standards in their practice.',
    ),
    QuestionAnswerPair(
      question: '5. Can I request a specific therapist?',
      answer:
      'Yes, at consciousleap, we understand the importance of a good therapeutic fit. While we provide a matching process to help you find a therapist based on your preferences and needs, you can also request a specific therapist if you have one in mind.',
    ),
    QuestionAnswerPair(
      question: '6. Are there any group therapy options available?',
      answer:
      'No, at consciousleap, we do not currently offer group therapy options. We primarily focus on providing individual therapy sessions to address the specific needs of our clients. However, we continually evaluate our services and aim to introduce group therapy options in the future. Please stay updated with our website and announcements for any changes or additions to our services.',
    ),
    QuestionAnswerPair(
      question: '7. How long does it take to connect with a Therapist?',
      answer:
      'At consciousleap, we aim to connect you with our Therapist in no time. You can either take a step-by-step approach to get matched to the right therapist by answering a simple questionnaire, or you can skip step 1 and choose from a range of Therapists to begin your mindful well-being journey.',
    ),
    QuestionAnswerPair(
      question: '8. How often should I schedule therapy sessions?',
      answer:
      'The frequency of therapy sessions can vary depending on individual needs and goals. It is typically recommended to start with weekly sessions to establish a therapeutic relationship and work on addressing your concerns. As progress is made, sessions may be reduced to biweekly or monthly appointments. Ultimately, the frequency of sessions is determined collaboratively between you and your therapist, based on your progress and ongoing needs.',
    ),
    QuestionAnswerPair(
      question: '9. What languages are supported for therapy sessions?',
      answer:
      'At consciousleap, we strive to provide therapy services in multiple languages to cater to diverse populations. Currently, we offer therapy sessions in English, Hindi, and other Indian regional languages. We are continuously working to expand our language offerings to accommodate more individuals.',
    ),
    QuestionAnswerPair(
      question: '10. Are the therapy sessions confidential?',
      answer:
      'Yes, confidentiality is of utmost importance to us. Our therapists adhere to strict ethical guidelines and maintain the privacy and confidentiality of all client information shared during therapy sessions.',
    ),
    QuestionAnswerPair(
      question: '11. How do I communicate with my Therapist?',
      answer:
      'Depending on your Therapist, you can communicate through your Dashboard (Preferred) or via Phone, email, or WhatsApp.',
    ),
    QuestionAnswerPair(
      question: '12. How do I change my Therapist?',
      answer:
      'As our mindful member, you can change your Therapist at any time if you’re unsatisfied with the experience. You can log in to your account member dashboard to rate your current Therapist and choose a new Therapist.',
    ),
    QuestionAnswerPair(
      question: '13. How do I provide feedback or review my therapy experience?',
      answer:
      'We highly value your feedback and encourage you to share your thoughts about your therapy experience with us. You can provide feedback or review your therapy experience through our member dashboard. We also welcome any suggestions or comments that can help us improve our services and better meet your needs.',
    ),
    QuestionAnswerPair(
      question: '14. How do I reschedule my session?',
      answer:
      'We have mindfully designed our member dashboard, which empowers you to schedule and reschedule sessions with the click of a button. Please refer to our rescheduling, refund and cancellation policy for more details.',
    ),
    QuestionAnswerPair(
      question: '15. Can I book therapy sessions for someone else?',
      answer:
      'Yes, you can book therapy sessions for someone else, such as a family member or a loved one. However, we recommend obtaining their consent and involving them in the process to ensure their willingness to participate in therapy.',
    ),
    QuestionAnswerPair(
      question: '16. Is there a cancellation policy for sessions?',
      answer:
      "Yes, we have a cancellation policy in place. We understand that unforeseen circumstances may arise that require you to cancel or reschedule a session. We kindly request that you provide at least 24 hours' notice for cancellations or rescheduling to avoid any cancellation fees. Please refer to our cancellation policy for more details. Please refer to our rescheduling, refund and cancellation policy for more details.",
    ),
    QuestionAnswerPair(
      question: '17. Minimum age requirements?',
      answer:
      'At consciousleap, we understand that mental health-related issues can affect us all, regardless of age. However, you must be at least 12 years or older and represented by a Parent or Guardian to avail of our services.',
    ),
    QuestionAnswerPair(
      question: '18. What is the process for reporting any issues or concerns about a therapist?',
      answer:
      'If you have any issues or concerns about your therapist, we take them seriously and want to address them promptly. You can contact our support team via email or phone to report any concerns you may have. We will investigate the matter thoroughly and take appropriate action to ensure the quality and safety of our services. Your well-being and satisfaction are our top priorities.',
    ),
    QuestionAnswerPair(
      question: '19. How do I register as a Therapist?',
      answer:
      'consciousleap is currently based in Estonia and India.',
    ),
    QuestionAnswerPair(
      question: '20. How do I deregister as a Therapist?',
      answer:
      'We’re truly heartbroken to see you go. Could you help us understand why you decided to go and if there’s anything we can do to change your mind?',
    ),
    QuestionAnswerPair(
      question: '21. How does Tele-Therapy work?',
      answer:
      'Tele-Therapy can happen through your preferred platforms, such as Zoom, Meet, or Teams, where our Therapists will conduct online therapy sessions in the comfort and convenience of your home, office, outdoor or mobile device. However, highly recommend a quitter place with a stable internet connection for smooth interaction.',
    ),
    QuestionAnswerPair(
      question: '22. What about face-to-face, in-person or 1:1 Therapy?',
      answer:
      'We currently don’t have any 1:1, i.e., face-to-face in-person sessions. However, we’re working on a few tie-ups to make this happen in the near future.',
    ),
    QuestionAnswerPair(
      question: '23. How do I proceed with Tele-Therapy?',
      answer:
      'consciousleap is currently based in Estonia and India.',
    ),
    QuestionAnswerPair(
      question: '24. How can I pay?',
      answer:
      'You can pay using your preferred mode of payment, i.e., via debit card, credit card, Google Pay, Samsung Pay, Apple Pay, or Paytm, as all of the above payment options are available.',
    ),
    QuestionAnswerPair(
      question: '25. Are there any hidden fees?',
      answer:
      'There are no hidden fees other than the ones stated at the time of payment.',
    ),
    QuestionAnswerPair(
      question: '26. What’s the session duration?',
      answer:
      'Each session lasts for 60 minutes.',
    ),
    QuestionAnswerPair(
      question: '27. What about my privacy?',
      answer:
      'Your right to privacy is paramount to us as we undertake all the precautionary measures to ensure your confidentiality through our strict non-disclosure agreement and privacy policy statement',
    ),
    QuestionAnswerPair(
      question: '28. What is a Conscious Store?',
      answer:
      'Our conscious store solely caters to locally sourced goods and provides locally produced, organic, environmentally friendly, and sustainable goods',
    ),
    QuestionAnswerPair(
      question: '29. What is your Conscious Store return policy?',
      answer:
      'It’s ok to change your mind, as we have a 14 days return policy for non-perishable goods.',
    ),
    QuestionAnswerPair(
      question: '30. How can I claim my session?',
      answer:
      'We’re currently in talks with the concerned providers and will update you via our newsletters, blog posts, and social media once we receive an update.',
    ),
    QuestionAnswerPair(
      question: '31. What is oneness?',
      answer:
      'I’m glad you asked; I am your ever-mindful companion in your well-being journey at consciousleap. Feel free to write to me at oneness@consciousleap.co or chat via our oneness Chatbot, and I’ll mindfully revert.',
    ),
    QuestionAnswerPair(
      question: '32. How can I register as a vendor?',
      answer:
      'We’re always looking to partner with individuals and businesses who share the same passion, mission, and vision as we do. Please reach out to us via business@consciousleap.co.',
    ),
    // Add more questions and answers as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FAQ's",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Comforta"),),
        centerTitle:true,
      ),
      body: ListView.builder(
        itemCount: faqData.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
            child: Container(
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: const GradientBoxBorder(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff4961AC),
                      Color(0xffF2685D),
                      Color(0xff4EC1BA)
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  ExpansionTile(
                    title: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        faqData[index].question,
                        style: TextStyle(
                          color: Color(0xff4961AC),
                          fontWeight: FontWeight.bold,
                          fontFamily: "Comforta",
                        ),
                      ),
                    ),
                    children: [
                      Container(
                        color: Colors.white70, // Grey background color for the answer
                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        child: Text(
                          faqData[index].answer,
                          style: TextStyle(fontFamily: "Comforta"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class QuestionAnswerPair {
  final String question;
  final String answer;

  QuestionAnswerPair({required this.question, required this.answer});
}


