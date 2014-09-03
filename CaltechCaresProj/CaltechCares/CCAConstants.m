//
//  CCAConstants.m
//  CaltechCares
//
//  Created by Megan Keehan on 7/26/14.
//  Copyright (c) 2014 Megan Keehan. All rights reserved.
//

#import "CCAConstants.h"

#define CELLTYPE_DEFAULT     0
#define CELLTYPE_TITLE       1
#define CELLTYPE_BULLET      2

@implementation CCAConstants

+ (NSArray *)getDefaultDataArray
{
    NSArray *array =
    @[@"Welcome", @"Welcome to the Caltech Cares app. Please tap the upper left button to see the menu and find what you are looking for."];
    return array;
}

+ (NSArray *)getDataArray
{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitHour | NSCalendarUnitWeekday fromDate:[NSDate date]];
    BOOL isLate = ([components weekday] != 1 && [components weekday] != 7) && ([components hour] < 8 || [components hour] > 17);
    NSArray *array =
    @[
    // First item in the list is the title of the section
    // After that, there is a list of titles within that section
    // After that, enter as many separate paragraphs in seperate spaces
    // Each space starts with a @", ends with ", (except the last one
    // which ends with ")

    // If you want a paragraph to appear as a title, put a 1 before it.
    // Eg: ..., @"1Title here, ...

    // If you want a paragraph to have a bullet point in front of it,
    // Put a 2 in front of it in a similar manner
        @[@"Emergency",
          @[
              @[((isLate) ? @"Regular Hours" : @"Regular Hours (now)"), @"Please get yourself to a safe place. Caltech security (626-395-5000) can reach the following resources in an emergency:", @"2Police, Fire and Paramedics", @"While Caltech Security can also connect you with the following resources, it is recommended you use their alternate phone number (626-395-4701) when trying to contact them.", @"2Confidential On-Call Counselor (Psychological Emergency and/or Sexual Assault Response)", @"2Non-Confidential On-Call RLC (Available for consultation and support in any situation)"],
              @[((isLate) ? @"After Hours (now)" : @"After Hours"), @"1Medical Emergencies", @"For medical emergencies on campus, call x5000 or (626) 395-5000. For medical emergencies off campus, call 911.", @"1Nearest Emergency Room", @"Huntington Memorial Hospital\n100 W. California Blvd.\nPasadena, CA\n626-397-5111", @"1Urgent Medical Conditions", @"Our contracted urgent care providers are:", @"Fair Oaks Urgent Care Center (Non-Emergencies)\n797 S. Fair Oaks Ave,\nPasadena, CA 91105\n(626)795-2244\nopen 7 days a week, 24 hours", @"Pasadena Community Urgent Care\n(Huntington Medical Foundation)\n3160 East Del Mar Avenue\nPasadena, CA  91107\n626-270-2400\nopen 10 a.m. - 7 p.m., 7 days a week", @"1Medical Consultation", @"If you are not sure whether you should go to the Urgent Care facility when the Health Center is closed call (626) 584-2421 and ask to speak with Dr. Stuart C. Miller for advice for non-emergency medical questions. If your situation is one that needs immediate attention (but is not an emergency) and can’t wait for Dr. Miller to return the page, it is best to go to Urgent Care.", @"1Psychological Emergencies", @"Call Campus Security at x4701 or (626) 395-4701 and ask to have the psychologist on call paged.", @"1Emergency Contraceptives", @"Students in need of emergency contraceptives can either go to Urgent Care or page Dr. Stuart Miller at (626) 584-2421."],
              @[@"Is This An Emergency?", @"1Questions to ask yourself", @"2Are you worried about the safety of yourself or anyone else?", @"2Do you or anyone else need immediate medical attention?", @"If either of the above could be answered as yes, then it is probably an emergency situation. Please call 626-395-5000 to get help.", @"1Is this a medical emergency?", @"Medical emergencies are situations that involve a serious injury or threat to life. Examples include:", @"2Difficulty breathing", @"2Unconsciousness or unresponsiveness", @"2Significant blood loss from open wounds", @"2Obvious fracture", @"2Chest Pain", @"Urgent medical conditions are those that are not life-threatening but need immediate attention and can be treated at our contracted urgent care center. Examples of urgent conditions include:", @"2Any injury with significant pain or swelling", @"2Possible fracture or dislocation", @"2Minor bee sting reaction", @"2Cuts or lacerations", @"2Illnesses that should be treated quickly and should not wait over the weekend such as strep throat, infections including urinary tract, etc."]
            ]
         ],

        @[@"Non-Emergency",
          @[
           @[@"Academics", @"There are lots of resources available if you need help in a class, or some simple advising. Here are some of the most utilized:", @"2The Undergraduate Dean’s Office offers general academic advice; manages the tutoring program; can request extensions from faculty; approves underload and overload petitions; and grants medical incompletes, among other things: http://deans.caltech.edu/Services/AcademicSupport", @"2The Office of the Registrar can also be a helpful resource for academic advising; UASH information; and enrollment questions: http://registrar.caltech.edu/", @"2The Hixon Writing Center offers help with essays and other writing assignments: http://writing.caltech.edu/", @"2Fellowships Advising and Study Abroad can help you leave Caltech for a little while: http://fasa.caltech.edu/", @"2SURF during the summer! http://sfp.caltech.edu/programs/surf", @"2And the Career Center can help you think about next steps: http://career.caltech.edu/"],
           
           @[@"Personal", @"Lots of people are available to talk to you about anything and everything. A recent break-up; roommate problems; questions about sexual or gender identity; family problems; long-term goal setting; medical issues; you name it, we’re willing to try to help. From the UCCs and RAs in the Houses, to the staff in the Center for Diversity, to the folks in the Counseling Center: We are here for you.", @"Confidential resources will not share anything you tell them with anyone else, unless your safety or someone else’s safety is demonstrably at risk. Non-confidential resources will only share information with anyone they think needs to know in order to better support you.", @"1Confidential", @"2The Student Counseling center provides confidential and free support to Caltech undergraduate and graduate students. The Counseling Center can be reached at 626-395-8331 or http://counseling.caltech.edu.", @"2Portia Harris, the Assistant Director of the Caltech Center for Diversity. She can be reached at 626-395-5772 or at pbharris@caltech.edu.", @"2Taso Dimitriadis, the Program Manager of the Caltech Center for Diversity. He can be reached at 626-395-8108 or at taso@caltech.edu", @"1Non-Confidential", @"2The Undergraduate Deans: Dean John Dabiri, Associate Dean Barbara Green, and Associate Dean Lesley Nye. 626-395-6351 or http://deans.caltech.edu/Contact/Deans", @"2Felicia Hunt, Title IX Coordinator. 626-395-3132 or TitleIXCoordinator@caltech.edu", @"2International Student Programs: Associate Director Laura Flower Kim and Adviser Daniel Yoder http://international.caltech.edu/contact/Contact", @"2Residential Life Coordinators: Erica Crawford (North Houses), ecrafor@caltech.edu; Larissa Charnsangavej (Grad Students/Catalinas), Larissa@caltech.edu; Joe Bennethum (Avery, Marks, Braun & Off Campus), jbenneth@caltech.edu; and TBA (South Houses) or http://deans.caltech.edu/Contact/RLC (requires on campus internet)", @"2Residential Associates: http://deans.caltech.edu/Contact/Ras", @"2Upperclass Counselors: need info on website"],
           
           @[@"Health and Well-Being", @"We really want to help you to take care of yourself and others in the community! Not feeling so well? Do you want some advice on how to manage stress? Are you worried about a friend’s use of alcohol? Do you want to get more exercise? Having a hard time figuring out how to eat more healthily? Here are the people who can help:", @"Confidential resources will not share anything you tell them with anyone else, unless your safety or someone else’s safety is demonstrably at risk. Non-confidential resources will only share information with anyone they think needs to know in order to better support you.", @"1Confidential", @"2The Student Health Center (unless sexual violence has occurred, in which case they will have to report it): (626) 395-6393 or http://healthcenter.caltech.edu/services", @"2Counseling Center: 626-395-8331 or http://counseling.caltech.edu.", @"2Caltech Health Education: jlevin@caltech.edu or 626-395-2961 http://healtheducation.caltech.edu/wellness", @"1Non-Confidential", @"2Student Health Advocate Program: http://healthcenter.caltech.edu/other/ health_advocate_program/roster", @"2Caltech Recreation Program (Fitness Classes, Personal Trainers, Intramurals, etc.): http://gocaltech.com/Recreation/index", @"2Caltech Dining Services: http://dining.caltech.edu/students/specserv", @"2The Undergraduate Deans: Dean John Dabiri, Associate Dean Barbara Green, and Associate Dean Lesley Nye. 626-395-6351 or http://deans.caltech.edu/Contact/Deans"],
           
           @[@"Sexual & Relationship", ((isLate) ? @"It is currently after hours. Hours are from 8am - 5pm during the week." : @"It is currently during hours. Hours are from 8am - 5pm during the week."), @"If you experience sexual violence, non-sexual violence, or any stigmatized crime after-hours you can seek support from confidential resources and/or seek medical help and the collection of forensic evidence.", @"Please consider that there are important steps to take immediately after a sexual assault: Preserve all physical evidence of the assault. Do not shower, bathe, douche, eat, drink, wash your hands, or brush your teeth until after you have had a medical examination. Save all of the clothing you were wearing at the time of the assault. Place each item of clothing in a separate paper bag. Do not use plastic bags. Do not clean or disturb anything in the area where the assault occurred.", @"1After-Hours Confidential", @"2On-Campus Confidential Support: Page the on-call psychologist via Campus Security: (626) 395-4701. You do not need to give your name or nature of the incident when you speak to the Security dispatcher. Simply tell Campus Security you want the on-call psychologist from the student Counseling Center paged. The on-call psychologist will return your call and will provide you with emotional support and options regarding medical treatment or advocacy.", @"2Off-Campus Confidential Support: Peace Over Violence for advocacy, support, and 24-hour crisis hotline: (626) 793-3385 (West San Gabriel Valley) http://www.peaceoverviolence.org/", @"1After-Hours Non-Confidential", @"You can seek medical treatment as well as support from any of these off-campus resources. They are required to report any crime to law enforcement. However, this does not mean you have to agree to meet with police officers, if you do not choose to do so. If you choose to visit one of these centers, you may call security (626-395-5000) and ask that the on-call RLC (a non-confidential resource) accompany you there.", @"2Caltech security (626-395-5000)", @"2SAN GABRIEL VALLEY MEDICAL CENTER SEXUAL ASSAULT RESPONSE TEAM CENTER for forensic evidence (the “rape kit”): (877) 209-3049 / 438 W. Las Tunas Drive, San Gabriel, CA", @"2RAPE TREATMENT CENTER AT SANTA MONICA-UCLA MEDICAL CENTER for forensic evidence, advocacy, support, and 24-hour hotline: (310) 319-4000", @"1On-Campus Confidential", @"2Portia Harris, the Assistant Director of the Caltech Center for Diversity, is designated a confidential resource on campus and can support and advocate for students who have experienced harassment or violence. She can be reached at 626-395-5772 or at pbharris@caltech.edu.", @"2Taso Dimitriadis, the Program Manager of the Caltech Center for Diversity, is designated a confidential resource on campus and can support and advocate for students who have experienced harassment or violence. He can be reached at 626-395-8108 or at taso@caltech.edu", @"2The Student Counseling center provides confidential and free support to Caltech undergraduate and graduate students. The Counseling Center can be reached at 626-395-8331 or http://counseling.caltech.edu.", @"1Off-Campus Confidential", @"2Peace Over Violence for advocacy, support, and 24-hour crisis hotline: (626) 793-3385 (West San Gabriel Valley) http://www.peaceoverviolence.org/", @"1Non-confidential Resources", @"If you choose to speak with one of these resources, you will be instructed on how to move forward with a complaint. Please see the Title IX website for more information on the process. https://titleix.caltech.edu/Filing", @"2Caltech’s Title IX Coordinator: Felicia Hunt (626) 395-3132 TitleIXCoordinator@caltech.edu", @"2The Undergraduate Deans: Dean John Dabiri, Associate Dean Barbara Green, and Associate Dean Lesley Nye. 626-395-6351 or http://deans.caltech.edu/Contact/Deans", @"2Residential Life Coordinators: Erica Crawford (North Houses), ecrafor@caltech.edu; Larissa Charnsangavej (Grad Students/Catalinas), Larissa@caltech.edu; Joe Bennethum (Avery, Marks, Braun & Off Campus), jbenneth@caltech.edu; and TBA (South Houses) or http://deans.caltech.edu/Contact/RLC (requires on campus internet)", @"1Reporting",  @"2Once you have gotten immediate support, you will want to think about whether you want to report the incident to the Institute. Please see the Title IX website https://titleix.caltech.edu/Filing for details, or speak with a Caltech confidential resource to review the process, and get more information. You are also encouraged to report to law enforcement."],
           
           @[@"Safety", @"If you see something, say something! We hope you feel secure here at Caltech. If not, tell us, and we will do something about it.", @"Here are some basic tips for personal safety: http://security.caltech.edu/Crime_Prevention/Personal_Safety", @"1Important Contacts", @"2Security (Emergency) 626-395-5000", @"2(Non-emergency) Escorts, Reports, Lock-out, etc. 626-395-4701", @"2Facilities Service Center: \n8 a.m. to 4 p.m., Monday through Friday: 626-395-4717\nEvenings and Weekends: 626-395-6571", @"2Safety Office:\n8 a.m. to 5 p.m., Monday through Friday: 626-395-6727\nEvenings and Weekends (emergency): 626-395-5000\nEvenings and Weekends (non-emergency): 626-395-4701", @"2Housing Office\n8 a.m. to 5 p.m., Monday through Friday: 626-395-6175\nEvenings and Weekends: 626-395-4701", @"2Counseling Center\n8 a.m. to 5 p.m., Monday through Friday: 626-395-8331\nEvenings and Weekends: 626-395-4701\nEmergency: 626-395-5000", @"1Other Resources", @"2In the event of a campus-wide emergency, please visit www.caltech.edu, where information will be posted as quickly as possible. Caltech has an information phone line for emergencies, at (888) 427-7465, or (626) 395-3291. This line provides recorded information about the impact of an emergency on the campus. This line is for information only.", @"2Map of Campus Security Phones: http://security.caltech.edu/documents/4-caltech-map-2009-07-01color.pdf", @"2Information on biological, chemical or bomb threats: http://security.caltech.edu/Threats", @"2Caltech’s Emergency Preparedness website: http://www.emergencypreparedness.caltech.edu/", @"2Shelter in Place procedxure: https://security.caltech.edu/documents/39-shelter_in_place_procedure.pdf"],
           
           @[@"Housing", @"Whether you are worried about the upcoming housing lottery (talk to Housing), simply cannot stand your roommate anymore (check with your RLC), have a leaky bathroom faucet (email maintenance), or need accommodations for a temporary disability (call Dean Green), we have your back. Resources for you include:", @"2Housing Office : 8 a.m. to 5 p.m., Monday through Friday: 626-395-6175\nEvenings and Weekends: 626-395-4701\nhttp://www.housing.caltech.edu/undergrad/", @"2Email Housing maintenance here: http://www.housing.caltech.edu/email/email_housing_maint.asp", @"2The Undergraduate Deans: Dean John Dabiri, Associate Dean Barbara Green, and Associate Dean Lesley Nye. 626-395-6351 or http://deans.caltech.edu/Contact/Deans", @"2Residential Life Coordinators: Erica Crawford (North Houses), ecrafor@caltech.edu; Larissa Charnsangavej (Grad Students/Catalinas), Larissa@caltech.edu; Joe Bennethum (Avery, Marks, Braun & Off Campus), jbenneth@caltech.edu; and TBA (South Houses) or http://deans.caltech.edu/Contact/RLC (requires on campus internet)", @"2Residential Associates: http://deans.caltech.edu/Contact/Ras", @"2Upperclass Counselors: need info on website", @"2Safety tips: http://security.caltech.edu/Crime_Prevention/Personal_Safety/Student_Residences]"],
           
           @[@"Financial", @"Are you worried about money? Do you feel as though you can’t keep track of what you spend? Is there an emergency at home, and you can’t afford the airfare to get there? There are people who can help.", @"2The financial aid office: http://www.finaid.caltech.edu/", @"The bursar’s office: http://bursar.caltech.edu/", @"2Financial literacy guide: http://www.higherone.com/oneforyourmoney/", @"2The Undergraduate Deans: Dean John Dabiri, Associate Dean Barbara Green, and Associate Dean Lesley Nye. 626-395-6351 or http://deans.caltech.edu/Contact/Deans", @"2Outside Scholarship information: http://www.finaid.caltech.edu/OS", @"2Information on work-study: http://www.finaid.caltech.edu/workstudy", @"2Federal Direct Loan Program: http://www2.ed.gov/offices/OSFAP/DirectLoan/index.html", @"2Other resources: http://www.finaid.caltech.edu/other"]
           ]
          ],
        @[@"Suicide & Panic Attacks",
         @[
             @[@"If You Are Suicidal", @"If you have taken steps to end your life, please call campus security at (626) 395-5000 so they can arrange for medical help. We ask you to do this so that we have a chance to help you with whatever leaves you feeling so overwhelmed that life is not worth living. We believe you can be helped. We would like a chance to try to help you.", @"If you are considering taking your life, please let us or someone try to help. We know that when people are suicidal they feel like nothing will help -- but we'd like to try, and it could make the difference for you. Please call the Caltech Student Counseling Center at (626) 395-8331 and one of the center's staff will talk with you. After 5:00 p.m. you may reach the on-call psychologist by contacting campus security at (626) 395-4701.", @"You may also contact the Suicide Prevention Center, a 24-hour suicide prevention hotline at (877) 727-4747."],
             
             @[@"If You Know Someone Who Is Suicidal", @"If someone has attempted to take their life, they are in need of medical assistance. If you are on campus, call Campus Security at (626) 395-5000, or if off-campus call 911 for emergency medical assistance.", @"If you are concerned that someone is in imminent danger of taking their life, call Campus Security at (626) 395-4701, or call 911 if you are off campus.", @"If you are concerned about a Caltech student who is not in any immediate danger of harming him or herself, please call the Counseling Center at (626) 395-8331 for a confidential consultation on how best to help. For emergencies after 5:00 p.m., you may reach the on-call psychologist by contacting campus security at (626) 395-4701.", @"If you are concerned about a Caltech staff or faculty member and are in need of consultation, you may call the Staff Faculty Consultation Center at (626) 395-8360.", @"You may also contact the Suicide Prevention Center, a 24-hour suicide prevention hotline at (877) 727-4747.", @"For non-emergency situations, ULifeline also provides additional resources on suicide prevention."],
             
             @[@"How to assess for suicide", @"2Explore what the student has already tried to do or has done in the past to deal with their depression.", @"2Help the person get moving. If there is something that the student can do to change their situation (e.g., get some tutoring, talk with their TA), encourage them to address their problem.", @"2Limit the advice you give. While encouragement and mobilization can be helpful when a person is depressed, it is probably best to refrain from giving advice too quickly because the student may feel like you are minimizing their situation or problem.", @"2Help them get help. Recognize when a problem is too difficult for the student or the two of you to handle alone.", @"2Ask the student if they have considered talking with someone. Find out how the student feels about talking with some (e.g., the RA or someone at the Counseling Center at (626) 395-8331). You may be able to help them get past their own reservations about getting help (e.g., reassure them that it does not mean someone is weak or crazy if they talk with a counselor).", @"2Get them connected with resources on campus that can provide more help (e.g., Counseling Center located in the Health Center at 1239 Arden Rd., RA's). You can help the student overcome their fears or apprehension of seeking help by offering to accompany them if they are reluctant to come in on their own.", @"2Ask them how things went after meeting with the counselor. This lets the student know that you are interested in them, but also understand that a student may not want to disclose the details of their meeting. Additionally, because of the limits of confidentiality, counselors will not be able to confirm if the student has come to the center, so asking the student directly if they have sought help will give you some reassurance.", @"2Be encouraging. Let the student know that it takes some time for things to change. Support the student in continuing to seek help.", @"2If the student continues to have problems, check in with them over time to see how things are going. Check to see if they are still getting help. Let the student know if you remain concerned or become more concerned. Consider calling the Counseling Center to see how you can be of help especially it the student is suicidal or if their problems persist.", @"If the student won’t get help, talk with someone at the Counseling Center at ext. 8331, or the Staff/Faculty Consultation Center about what you can do to further help the student. ULifeline also provides online resources about suicide assessment."],
             
             @[@"Suicide Prevalence and Risk Factors", @"It is estimated that 30,000 Americans commit suicide a year and the World Health Organization reports an estimate of 1.8 percent of all deaths worldwide result from suicide each year.", @"1Risk factors for Suicide", @"290% of people who commit suicide have a mental illness, most of whom weren’t in treatment.", @"2Prior suicide attempts: 1⁄4 to 1⁄2 people who commit suicide made previous attempts.", @"2Previous suicidal threats: 3⁄4 of people who commit suicide give warning of intentions.", @"2Family history of suicide or mental illness: (e.g., depression, bipolar disorder, schizophrenia).", @"2Recent death of a friend or acquaintance (especially by suicide): 1/3 of suicide attempts are associated with a loss.", @"2Lack of social support.", @"2Drug or alcohol use: a significant number of people who commit suicide are under the influence at the time."],
             
             @[@"Signs of Potential Suicide", @"2Depression or feelings of hopelessness.", @"2Talking about suicide: Any comment about not wanting to live, saying people would be better off without them, or how they won't be around much longer.", @"2An interest in music, books, or movies about suicide.", @"2Giving away prized possessions.", @"2Preparing for death (e.g., writing a will, writing letters to friends).", @"2Acquiring the means to commit suicide (e.g., stockpiling pills, buying a weapon).", @"2Sudden lift in spirits that can result when a depressed person has come to a decision to end their life."],
             
             @[@"Myths About Suicide", @"2Myth: Talking with someone about suicide will put the idea into their head.\n\nReality: Talking about suicide gives the person a chance to talk about it and get help.", @"2Myth: Attempts are meant only for attention. They are not serious.\n\nReality: Any time someone threatens or attempts suicide, it is serious; it indicates that something is wrong. People often make attempts before they finally commit suicide.", @"2Myth: People make conscious rational decisions to take their life.\n\nReality: Suicide is most often the results of a psychiatric disorder, primarily depression or manic-depression rather than a conscious rational decision. Suicide is also related to schizophrenia, alcoholism/substance abuse and personality disorders. Dr. Kay Redfield Jamison, a noted researcher on bipolar disorder and suicide, reports that \"in all of the major investigations to date, 90-95 percent of people who committed suicide had a diagnosable psychiatric illness.\" These psychiatric disorders are treatable, meaning most suicides are preventable.", @"2Myth: Suicide is the result of an impulsive action on the part of the individual.\n\nReality: Most suicides are the culmination of a protracted process, often over a 2-year period that results in a person taking their life. Initially, the person experiences a loosening of their own and societal inhibition against suicide. There is a shift from thinking of suicide as immoral or unthinkable to seeing it as a viable option over time. When a person begins to consider how they might take their life they are more at risk if they have acquired the means to take their life and have a plan and intention to carry their plan out. If drugs and alcohol are involved, or the person suffers from a personality disorder, it may increase the possibility that the person could take their life impulsively."],
             
             @[@"How Can You Talk With Someone About Suicide?", @"1Assess the Risk of Suicide", @"2How serious or imminent: Follow up on anything the student has said that makes you wonder if they are suicidal (e.g., \"What did you mean when you said you don't care about your grades because you probably wouldn't be around at the end of the term anyway?\"). Remember to take all threats seriously.", @"2Be direct but gentle: \"When you say these things, it makes me wonder if you're thinking about suicide. Are you?\"", @"2Do they have a plan? How thought out is the plan?", @"2Do they have a means to harm themselves (e.g., access to a gun, pills, knife)?", @"2Do they say they intend to carry out their plan?", @"The more developed the plan the more serious the danger and even more dangerous if they have the means to harm themselves and they use alcohol or drugs. Use of drugs and alcohol can impair judgment and contribute to a person spontaneously acting on feelings of self harm.", @"If a person is thinking about suicide, but they have no clear plan or means and they deny any intention, you have some time to get the student help. Consult with an RA or the Counseling Center.", @"Help the student get connected with the Counseling Center (e.g., escort them if necessary). We are located in the Health Center on Arden Road. For after hours emergency care, call campus security ext. 4701 and ask to have the on-call psychologist paged.", @"1If the person is thinking about suicide and they have a plan", @"Involve someone right away.", @"2\"You're telling me you've thought about suicide enough that you even have a plan. That has me really scared for you. I want to talk to someone about how to help you.\"",@"2If the person intends to or is threatening to harm themselves: Involve someone right away. Call the on-call psychologist at the Counseling Center at ext. 8331 or by calling Campus Security at ext. 4701 after hours, ask to have the on-call psychologist paged.", @"2If the person has taken pills or harmed themselves: This is a medical emergency. The student needs to be taken to the emergency room for immediate medical attention. Call security at ext. 5000 or call 911 if you are off-campus.", @"1What makes helping in this situation so difficult?", @"2Sense of responsibility - You are not expected to handle this on your own; if you suspect suicidal behavior, involve others.", @"2Sense of urgency (worrying that something is going to happen right away) - Unless the person has actually made an attempt or has the means at hand, you will have some time to get help.", @"2Fear that you’ll make the person mad by involving others - Getting them help has to be your priority.", @"2Betraying trust if you’ve promised not to tell anyone - If a person asks you not to tell anyone if they are suicidal you should be honest with them and let them know that is not a promise you can keep. It is too much for any one person to hold and it prevents them from getting the help they need. Bottom line: Be honest about what you can and cannot hold in confidence - their safety is the priority.", @"2You may not know the student - This can make the conversation difficult to initiate. Just be honest (e.g., \"I know I really don't know you, but your friends have talked to me, and they're concerned about how things are going for you.\")"],
             
             @[@"Suicide Resources", @"2Caltech Student Counseling Center: (626) 395-8331", @"2ULifeline provides self-assessments and resources on suicide prevention", @"2On-Line Depression Inventory", @"2Helping the Distressed Student; A Resource Guide to Staff and Faculty", @"2Information for Survivors of Suicide", @"2Staff/Faculty Consultation Center: X8360", @"2Caltech Campus Security: x4701 or (626) 395-4701; x5000 or (626) 395-5000 (medical emergencies)", @"2Suicide Prevention Center: (877) 727-4747", @"Video: Between Friends: Conversations that Can Save a Life: https://counseling.caltech.edu/general/BetweenFriends", @"2Online Mental Health Resources: https://counseling.caltech.edu/general/InfoandResources"],
             
             @[@"Panic Attack Information", @"Panic attacks are unpleasant but common experiences that affect about 2.7% of the population each year. They occur when the body is unexpectedly sent into a state of physiological arousal. Sometimes there is an clear trigger, but many times there is not. Panic attacks are a natural and instinctual reaction – the fight or flight response – that gets triggered in a situation when it is not necessary or helpful. They typically reach peak intensity within 10 minutes and can last up to 20 or 30 minutes, though infrequently they can last up to an hour.", @"1Signs and Symptoms", @"2Palpitations, pounding heart or rapid heart rate", @"2Sweating, trembling, or shaking", @"2Shortness of breath, sensations of choking or smothering", @"2Chest pain or discomfort", @"2Abdominal distress or nausea", @"2Dizziness, lightheadedness, feeling faint, unsteady", @"2Feelings of unreality or feeling detached from yourself", @"2Fear of losing control, going crazy, or dying", @"2Numbness or tingling", @"2Chills or hot flashes"],
             
             @[@"What to do with Panic Attacks", @"Remind yourself that even though the symptoms are extremely unpleasant and frightening, a panic attack is not life threatening. They cannot cause you to have a heart attack or go into  cardiac arrest, and they will not cause you to suffocate or faint.", @"As much as possible, focus your attention on your breath and try to keep breathing as normally as possible. Keeping your breathing regular is a good way to shorten the duration and intensity of a panic attack. Remind yourself that you are safe and that this will pass.", @"It is very common to have intense feelings of worry about the physical symptoms of the panic attack. In turn, these worries keep you feeling anxious and accidentally prolong the experience of panic. As much as possible, then, try to keep your attention on what is happening in the present – not what might happen in the future. If you can, label each sensation and experience as it arises. For instance, say privately to yourself, “I’m noticing my heart beating faster...now I’m noticing my stomach churning...now I’m noticing that I think this is never going to stop...”, and so on. Labeling experiences in this way can help you not get overly caught up in them.", @"After the panic attack is over, if you find yourself continuing to worry about the physical symptoms of panic, it can be reassuring to talk with a counselor or physician to learn more about coping with panic attacks."]
             ]
        ],
        @[@"Other", @[ @[@"Map", @"Map"]]]
    ];
    return array;
}

@end