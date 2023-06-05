# vfb-mill
How partner earned credit is calculated and paid

    Article
    05/09/2022
    5 minutes to read

Appropriate roles: Global admin | User management admin | Admin agent | Billing admin | Sales agent

Partner earned credit (PEC) for managed services recognizes and rewards partners who own IT operational control and management of some or all of a customers’ Azure environment.

By default, as a Cloud Solution Provider (CSP) partner, you’re granted the necessary access rights to your customer's subscription. That enables you to perform operational management and control of the resources on the subscription. Other ways in which customers can provision access for transacting partners is described in the following section.

The monthly invoice amount is the net of the partner earned credit. You can see PEC details on your monthly recon file. For other ways in which a customer can provision access for the transacting partner, see the following articles:

    Manage subscriptions and resources under the Azure plan
    Reinstate admin privileges for Azure CSP subscriptions

Eligibility

To receive partner earned credit (PEC), the following requirements apply:

    You must have an active MPN agreement and valid role-based access control (RBAC) role.

    There are three options in which access permissions can be set:
        Admin on behalf of (AOBO) is the default. When a Partner provisions an Azure Plan subscription for a customer, AOBO is set in the form of a “foreign principal” who inherits owner permissions on the Azure subscription. The AOBO permissions mean that a certain group in the CSP Partner Center tenant (Admin Agents) will inherit those permissions. Read more about those permissions.
        Azure Lighthouse is an optional concept suitable for Partners who are interested in enabling sophisticated cross-tenant management experiences for Azure solutions. Like AOBO, Azure Lighthouse allows groups of users in the (Partner) management tenant to inherit delegated permissions in the customer’s Azure subscription. The difference is that it allows for more granular definition of groups and permission levels than AOBO. Read more about Azure Lighthouse.
        Individual user accounts and service principals: For some scenarios, it might be more suitable to work with individual user accounts having permissions on Azure Subscriptions. This user account can be guest user accounts (from any tenant) or user accounts created in the customer tenant or service principals. For more information, see Link your partner ID to track your impact on delegated resources.

    In the case of indirect providers and their indirect resellers, an indirect provider is eligible for PEC if either the indirect provider or the indirect reseller or both have AOBO privileges or an eligible RBAC role. For more information, see Reinstate admin privileges for Azure CSP subscriptions.

    PEC is earned on Azure resource level, resource group or subscription. If a partner has valid access at either the subscription or resource group level, each resource that rolls up to the higher entity will earn PEC.

    PEC isn't applicable to the following services:
        Azure plan reservations
        Third-party products identified as Third Party in the Tags column of the Azure plan consumption price
        Products in the Marketplace price list
        Azure Spot Virtual Machines

If you have issues with PEC, see Troubleshooting partner earned credit.

In addition to the requirements above, PEC is only applicable to services listed in the Azure plan consumption pricing. You can view and export this pricing from the Azure plan pricing page.

For more detailed information, see Troubleshooting partner earned credit.

For more information on PEC, see the Microsoft Cost Management page.

For more information on eligibility, see Roles and permissions required to earn partner earned credit.
Calculation

PEC is calculated daily. You're paid for each day you have PEC eligible access on each subscription. Although PEC details don’t appear your monthly invoice, PEC earnings are factored into the adjusted net charges line within the invoice. You can find more PEC details on the daily usage file and in the monthly invoice recon file. All values are in USD, as shown in column AI, PricingCurrency.

Screenshot of a Partner Center reconciliation file identifying columns.

The table below describes the PEC elements found in the monthly invoice recon file.
Column 	Description
C 	CustomerName
P 	UnitPrice
AD 	EffectiveUnitPrice is the price after PEC is applied and the requirements have been met. When PEC is applied, you’ll see that the EffectiveUnitPrice in column AD is a percentage less than the UnitPrice in column P.
V 	PriceAdjustmentDescription. This will be blank if no requirements for PEC are met or have the PEC % that will be applied to UnitPrice. However, you may be eligible for additional credits. If so, they'll be listed in this column. Example: 100% Tier 1 Discount.

To monitor PEC access:

    Daily rated usage file shows where PEC is applied (or not) on a daily basis.

    Azure monitor alerts monitor changes to persistent privileged access.

The daily rated usage file:

Screenshot of a Partner Center daily rated usage file highlighting the effective unit price.
Partner earned credit API

A PEC API is available as part of the Azure API toolset. For information on PowerShell and CLI APIs, see Link an Azure account to a partner ID.
Microsoft Cost Management and PEC

Microsoft Cost Management (ACM) using Cost Analysis enables you, as a partner, to view the costs that have received the benefit of PEC. For a detailed presentation on ACM, see the May 2021 CSP Spotlight call.
Use ACM to view your partner earned credit

    In the Azure portal, sign in to your partner tenant and select Cost Management + Billing.

    Select Cost management.

    Select Cost analysis. The Cost analysis view will display the costs for your billing account, for all the services purchased and consumed at the prices that you pay Microsoft. Screenshot of a cost management cost analysis page.

    In the pivot chart drop-down list, select PartnerEarnedCreditApplied.

        If this value is True, the associated cost has the benefit of the partner earned credit.

        If this value is False, the associated cost hasn't met the required eligibility for the credit, or the service purchased isn't eligible for partner earned credit.

Note

Typically, usage for services takes 8-24 hours to appear in Cost Management, and the PEC credits will appear within 48 hours from time of access in Microsoft Cost Management.

You can also group by, and filter by, the PartnerEarnedCreditApplied property using the Group by and Add filter features. These filters allow you to drill into costs that have PEC and the costs that have no PEC applied.
How is PEC paid?

PEC earnings are factored into the adjusted net charges line within the invoice. The Total of the invoice shown below illustrates this. For adjustment details, see the monthly invoice reconciliation file and Azure daily rated usage file.

Screenshot of a Partner Center invoice stating that adjustment details appear on recon and Azure daily usage files.
Next steps

    Price list for the new commerce experience for Azure in CSP
    Manage subscriptions and resources under the Azure plan
    New commerce experience in CSP - Azure billing
    Reinstate admin privileges for Azure CSP subscriptions
