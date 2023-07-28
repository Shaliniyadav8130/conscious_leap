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


